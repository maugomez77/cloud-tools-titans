{{- $titanSideCars := .titanSideCars }}
{{- if $titanSideCars }}
  {{- $ingress := $titanSideCars.ingress }}
  {{- $egress := $titanSideCars.egress }}
  {{- $validation := $titanSideCars.validation }}
  {{- $clusters := $validation.clusters | default dict }}
  {{- $envoy := $titanSideCars.envoy }}
  {{- $counter := 0 -}}
  {{- if or (hasKey $ingress "routes") (hasKey $egress "routes") }}

#!/bin/bash

# functions 
generate_token_call_data()
{

  privs=$(cat /tests/privs)
  roles=$(cat /tests/roles)
  scope=$(cat /tests/scope)
  uri=$(cat /tests/uri)
  customer_id=$(cat /tests/customer_id)
  domain_id=$(cat /tests/domain_id)

  cat <<EOF
{ 
    "privs": "$privs",
    "roles": "$roles",
    "scope": "$scope",
    "roles": "$roles",
    "uri": "$uri",
    "customer_id": "$customer_id",
    "domain_id": "$domain_id"
}
EOF
}

function get_token() {
   tokenresp=$(curl --write-out '%{http_code}' --silent --output /tests/token \
  -H "Accept: application/json" \
  -H "Content-Type:application/json" \
  -X POST --data "$(generate_token_call_data)" "http://token-generator:8080/tokens?ttl=10000");
  if [ "$tokenresp" != "200" ];
  then
    echo "####### Unable to get token from token-generator #######"
    echo "####### Unable to get token from token-generator #######" > "/tests/logs/get_token_call_error_status.log"
    rm /tests/token
  fi
}

function set_system_token_content() {
  echo "/user-directory/v1/users/8Vskw2k-tUL5yKXp8X5u-Q" > "/tests/uri"
  echo "system" > "/tests/scope"
  echo "symantecdomain2" > "/tests/domain_id"
  echo "symantecinfra2" > "/tests/customer_id"
  echo "<domain::core::CC_Onboard_Service_User>" > "/tests/roles"
  echo "assign_any_role_member core_internal_access create_customer_token create_idp_user create_orders create_system_token create_users delete_events delete_users deprovision_customer domain_remapping edit_users enroll_devices epmp_internal_access extend_licenses file_upload login manage_adsync_jobs manage_customer manage_devices manage_domain manage_domain_status manage_domain_subscription manage_groups manage_licenses manage_org_units manage_organization manage_products manage_services manage_subscription manage_support_notification manage_tenant_remap manage_user_profiles manage_users oauth_client_mgmt provision_customer provision_users read_all_organizations read_any_role read_organization read_workflow require_second_factor_auth retry_workflow saas_create_customer saas_manage_workflow scan_all_users send_user_message support_view_news_article unblock_bounced_email update_account_default use_licenses usvc_search_login view_access_profile view_customers view_domain view_domain_subscription view_events view_external_idp view_groups view_idp view_idp_user view_org_units view_products view_roles view_services view_subscriptions view_system_registry view_user_profiles view_users view_utilization write_roles write_user_profiles write_users write_workflow" > "/tests/privs"
}



# setup single trap
trap 'trp' SIGUSR1
trap 'trp' SIGTERM
trp() {
  echo "[`date -Is`] receive signal to exit" >> "/tests/logs/prox-health-check.log"
  exit 0
}

# health check
while :         
do
  healthCheck=$(curl --insecure --write-out '%{http_code}' --silent --output /dev/null -X GET "https://proxy:9443/healthz");
  if [ "$healthCheck" != "200" ];
  then
    echo "[`date -Is`] healthCheck: $healthCheck" >> "/tests/logs/prox-health-check.log"
  else
    break
  fi
  sleep 1        
done

set_system_token_content
get_token

jwttoken=$(cat /tests/token | jq -r '.access_token')

    {{ if hasKey $ingress "routes" }}
# Process ingress routes
      {{- range $ingress.routes }}
        {{- $cluster := "proxy" }}
        {{- $route := .route }}
        {{- if $route }}
          {{- if $route.cluster }}
            {{- $cluster = $route.cluster }}
          {{- end }}
        {{- end }}
{{ template "process_routing_validation" (dict "routing" . "cluster" $cluster "clusters" $clusters "direction" "ingress" "scheme" "https://proxy:9443" "respfile" "/tests/logs/resp.txt" "reportfile" "/tests/logs/report.txt") }}
        {{- $counter = add1 $counter -}}
      {{- end }}     
    {{- end }}

    {{ if hasKey $egress "routes" }}
# Process egress routes
      {{- range $egress.routes }}
        {{- $cluster := "proxy" }}
        {{- $route := .route }}
        {{- if $route }}
          {{- if $route.cluster }}
            {{- $cluster = $route.cluster }}
          {{- end }}
        {{- end }}
{{ template "process_routing_validation" (dict "routing" . "cluster" $cluster "clusters" $clusters "direction" "egress" "scheme" "http://proxy:9565" "respfile" "/tests/logs/resp.txt" "reportfile" "/tests/logs/report.txt") -}}
        {{- $counter = add1 $counter -}}
      {{- end }}
    {{- end }}
  {{- end }}
{{ printf "echo \"Completed process %d tests\" >> \"/tests/logs/report.txt\"\n" $counter }}
{{- end }}

{{- define "process_routing_validation" -}}
  {{- $routing := .routing -}}
  {{- $clusters := .clusters -}}
  {{- $cluster := .cluster -}}
  {{- $respfile := .respfile -}}
  {{- $direction := .direction -}}
  {{- $reportfile := .reportfile -}}
  {{- if $routing -}}
    {{- $scheme := .scheme -}}
    {{- $rtest := false -}}
    {{- if eq $direction "ingress" -}}
      {{- if hasKey $routing "route" -}}
        {{- $rtest = true -}}
      {{- end -}}
    {{- else if eq $direction "egress" -}}
      {{- $rtest = true -}}
    {{- end -}}
    {{- if $rtest -}}
      {{- if $routing.match -}}
        {{- template "validate_routing_curl_jq_cmds" (dict "routing" $routing "cluster" $cluster "clusters" $clusters "scheme" $scheme "respfile" $respfile "reportfile" $reportfile) -}}
      {{- else if $routing.route -}}
        {{- $route := $routing.route -}}
        {{- if and $route.cluster $clusters -}}
          {{- $clusteValue := index $clusters $route.cluster -}}
          {{- if $clusteValue }}
            {{- range $clusteValue.routes }}
              {{- template "validate_routing_curl_jq_cmds" (dict "routing" . "cluster" $cluster "clusters" $clusters "scheme" $scheme "respfile" $respfile "reportfile" $reportfile) -}}
            {{- end }}
          {{- end }}
        {{- end }}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}


{{- define "validate_routing_curl_jq_cmds" -}}
  {{- $routing := .routing -}}
  {{- $respfile := .respfile -}}
  {{- $reportfile := .reportfile -}}
  {{- $cluster := .cluster -}}
  {{- $scheme := .scheme -}}
  {{- $path := "" -}}
  {{- $cmd := "" -}}
  {{- $method := "GET" -}}
  {{- $headers := dict -}}
  {{- if hasKey $routing "match" -}}
    {{- $match := $routing.match -}}
    {{- if hasKey $match "method" -}}
      {{- $method = $match.method -}}
    {{- end -}}
    {{- if hasKey $match "prefix" -}}
      {{- $path = printf "%s/abc" (trimSuffix "/" $match.prefix) -}}
    {{- else if hasKey $match "path" -}}
      {{- $path = printf "%s" $match.path -}}
    {{- else if hasKey $match "regex" -}}
      {{/* $path = randomRegex $match.regex */}}
    {{- end -}}
    {{- if hasKey $match "headers" -}}
      {{- range $match.headers -}}
        {{- $key := .key -}}
        {{- $val := "" -}}
        {{- if eq $key "Authorization" -}}
          {{- if hasPrefix "Basic" .sw -}}
            {{- $val = printf "Basic %s" (b64enc "test:test") -}}
          {{- end -}}
        {{- else if hasKey . "eq" -}}
          {{- $val = .eq -}}
        {{- else if hasKey . "sw" -}}
          {{- $val = printf "%s%s" .sw (randAscii 5) -}}          
        {{- else if hasKey . "ew" -}}
          {{- $val = printf "%s%s" (randAscii 5) .ew -}}             
        {{- else if hasKey . "co" -}}
          {{- $val = printf "%s%s%s" (randAscii 5) .co (randAscii 5) -}}              
        {{- else if hasKey . "lk" -}}
          {{/*- $val = randomRegex .lk -*/}}
        {{- else if hasKey . "pr" -}}
          {{- if .pr -}}
            {{- $val = "def" -}}          
          {{- end }}
        {{- else if hasKey . "neq" -}}
          {{- $val = printf "%s%s" .neq (randAscii 5) -}}          
        {{- else if hasKey . "nsw" -}}
          {{- $val = printf "%s%s" (randAscii 5) .nsw -}}          
        {{- else if hasKey . "new" -}}
          {{- $val = printf "%s%s" .new (randAscii 5) -}} 
        {{- else if hasKey . "nco" -}}
          {{- $val = printf "%s" (randAscii 5) -}} 
        {{- else if hasKey . "nlk" -}}
        {{/* {{- $val = printf "%s" (randAscii 5) -}}  */}}
        {{- end -}}
        {{- if ne $val "" -}}
          {{- if eq $key ":path" -}}
            {{- $path = $val -}}
          {{- else if eq $key ":method" -}}
            {{- if .eq }}
              {{- $method = upper .eq -}}
            {{- else if .neq -}}
              {{- $neq := upper .neq -}}
              {{- if ne "GET" $neq -}}
                {{- $method = $neq -}}
              {{- else if ne "POST" $neq -}}
                {{- $method = $neq -}}
              {{- else if ne "PUT" $neq -}}
                {{- $method = $neq -}}
              {{- else if ne "DELETE" $neq -}}
                {{- $method = $neq -}}
              {{- else if ne "PATCH" $neq -}}
                {{- $method = $neq -}}
              {{- end -}}
            {{- end }}
          {{- else -}}
            {{- $_ := set $headers $key $val -}}
          {{- end -}}
        {{- end -}}
      {{- end }}
    {{- end }}
    {{- if hasPrefix "http:" $scheme -}}
      {{- $cmd = printf "code=$(curl --write-out '%%{http_code}' --silent --output %s" $respfile -}}
      {{- range $k, $v := $headers -}}
        {{- $cmd = printf "%s %s" $cmd (printf "-H \"%s: %s\"" $k $v) -}}
      {{- end -}}
      {{- $cmd = printf "%s %s" $cmd (printf "-X %s \"%s%s\");" $method $scheme $path) -}}
    {{- else -}}
      {{- $cmd = printf "code=$(curl --insecure --write-out '%%{http_code}' --silent --output %s" $respfile -}}
      {{- range $k, $v := $headers -}}
        {{- $cmd = printf "%s %s" $cmd (printf "-H \"%s: %s\"" $k $v) -}}
      {{- end -}}
      {{- $cmd = printf "%s %s" $cmd (printf "-X %s \"%s%s\");" $method $scheme $path) -}}      
    {{- end -}}
    {{- printf "%s\n" $cmd -}}
    {{- if hasKey $routing "redirect" -}}
      {{- $redirect := $routing.redirect -}}
      {{- printf "  if [ \"$code\" != \"%s\" ]\n" ($redirect.responseCode | default "301") -}}
      {{- printf "  then\n" -}}
      {{- printf "    echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
      {{- printf "    echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
      {{- printf "    echo \"    expect: status code[%s], but got status code[$code]\" >> %s\n" $redirect.responseCode $reportfile -}}
      {{- printf "  else\n" -}}
      {{- printf "    echo \"Succeed at cmd[%s]\" >> %s\n" $cmd $reportfile -}}
      {{- printf "  fi\n" -}}
    {{- else if hasKey $routing "directResponse" -}}
      {{- $directResponse := $routing.directResponse -}}
      {{- printf "  if [ \"$code\" != \"%s\" ]\n" $directResponse.status -}}
      {{- printf "  then\n" -}}
      {{- printf "    echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
      {{- printf "    echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
      {{- printf "    echo \"    expect: status code[%s], but got status code[$code]\" >> %s\n" $directResponse.status $reportfile -}}
      {{- printf "  else\n" -}}
      {{- printf "    echo \"Succeed at cmd[%s]\" >> %s\n" $cmd $reportfile -}}
      {{- printf "  fi\n" -}}
    {{- else if hasKey $routing "route" -}}
      {{- $route := $routing.route -}}
      {{- printf "  if [ \"$code\" != \"200\" ]\n" -}}
      {{- printf "  then\n" -}}
      {{- printf "    echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
      {{- printf "    echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
      {{- printf "    echo \"    expect: status code[200], but got status code[$code]\" >> %s\n" $reportfile -}}
      {{- printf "  else\n" -}}
      {{- if hasKey $route "prefixRewrite" -}}
        {{- printf "    path=$(cat %s | jq -r '.http.originalUrl')\n" $respfile -}}
        {{- printf "    if [[ $path != *\"%s\"* ]]\n" $route.prefixRewrite -}}
        {{- printf "    then\n" -}}
        {{- printf "      echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
        {{- printf "      echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
        {{- printf "      echo \"    expect: prefix path[%s], but got path[$path]\" >> %s\n" $route.prefixRewrite $reportfile -}}
        {{- printf "    fi\n" -}}
      {{- end -}}
      {{- printf "    host=$(cat %s | jq -r '.host.hostname')\n" $respfile -}}
      {{- printf "    if [ \"$host\" != \"%s\" ]\n" $cluster -}}
      {{- printf "    then\n" -}}
      {{- printf "      echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
      {{- printf "      echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
      {{- printf "      echo \"    expect: route to host[%s], but got host[$host]\" >> %s\n" $cluster $reportfile -}}
      {{- printf "    fi\n" -}}
      {{- printf "  fi\n" -}}    
    {{- else -}}
      {{- printf "  if [ \"$code\" != \"200\" ]\n" -}}
      {{- printf "  then\n" -}}
      {{- printf "    echo \"Failed at cmd[%s %s%s]\" >> %s\n"  $method $scheme $path $reportfile -}}
      {{- printf "    echo \"    expect: status code[200], but got status code[$code]\" >> %s\n" $reportfile -}}
      {{- printf "  else\n" -}}
      {{- printf "    host=$(cat %s | jq -r '.host.hostname')\n" $respfile -}}
      {{- printf "    if [ \"$host\" != \"%s\" ]\n" $cluster -}}
      {{- printf "    then\n" -}}
      {{- printf "      echo \"Failed at cmd[%s %s%s]\" >> %s\n" $method $scheme $path $reportfile -}}
      {{- printf "      echo \"  headers:%s\" >> %s\n" $headers $reportfile -}}
      {{- printf "      echo \"    expect: route to host[%s], but got host[$host]\" >> %s\n" $cluster $reportfile -}}
      {{- printf "    fi\n" -}}
      {{- printf "  fi\n" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}