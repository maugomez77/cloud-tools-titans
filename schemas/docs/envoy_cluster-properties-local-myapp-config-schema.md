# local-myapp config schema Schema

```txt
envoy_cluster.json#/properties/local-myapp
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [envoy\_cluster.json\*](../out/envoy_cluster.json "open original schema") |

## local-myapp Type

`object` ([local-myapp config schema](envoy_cluster-properties-local-myapp-config-schema.md))

# local-myapp Properties

| Property                                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                      |
| :---------------------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [address](#address)                             | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-address.md "envoy_cluster.json#/properties/local-myapp/properties/address")                                                         |
| [addRequestHeaders](#addrequestheaders)         | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-request-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/addRequestHeaders")         |
| [addResponseHeaders](#addresponseheaders)       | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-response-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/addResponseHeaders")       |
| [directResponseCode](#directresponsecode)       | Merged   | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode.md "envoy_cluster.json#/properties/local-myapp/properties/directResponseCode")                                   |
| [directResponseMessage](#directresponsemessage) | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsemessage.md "envoy_cluster.json#/properties/local-myapp/properties/directResponseMessage")                             |
| [gateway](#gateway)                             | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/gateway")                                           |
| [healthChecks](#healthchecks)                   | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-healthchecks-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/healthChecks")                                 |
| [idleTimeout](#idletimeout)                     | Merged   | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout.md "envoy_cluster.json#/properties/local-myapp/properties/idleTimeout")                                                 |
| [path](#path)                                   | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-path.md "envoy_cluster.json#/properties/local-myapp/properties/path")                                                               |
| [removeRequestHeaders](#removerequestheaders)   | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-request-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/removeRequestHeaders")   |
| [removeResponseHeaders](#removeresponseheaders) | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-response-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/removeResponseHeaders") |
| [retryPolicy](#retrypolicy)                     | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-retry-policy-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/retryPolicy")                      |
| [scheme](#scheme)                               | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-scheme.md "envoy_cluster.json#/properties/local-myapp/properties/scheme")                                                           |
| [timeout](#timeout)                             | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-timeout.md "envoy_cluster.json#/properties/local-myapp/properties/timeout")                                                         |

## address



`address`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-address.md "envoy_cluster.json#/properties/local-myapp/properties/address")

### address Type

`string`

## addRequestHeaders



`addRequestHeaders`

* is optional

* Type: `object` ([local-myapp add request headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-request-headers-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-request-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/addRequestHeaders")

### addRequestHeaders Type

`object` ([local-myapp add request headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-request-headers-config-schema.md))

## addResponseHeaders



`addResponseHeaders`

* is optional

* Type: `object` ([local-myapp add response headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-response-headers-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-response-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/addResponseHeaders")

### addResponseHeaders Type

`object` ([local-myapp add response headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-add-response-headers-config-schema.md))

## directResponseCode



`directResponseCode`

* is optional

* Type: merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode.md "envoy_cluster.json#/properties/local-myapp/properties/directResponseCode")

### directResponseCode Type

merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode.md))

one (and only one) of

* [Untitled integer in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode-oneof-0.md "check type definition")

* [Untitled string in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsecode-oneof-1.md "check type definition")

## directResponseMessage



`directResponseMessage`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-directresponsemessage.md "envoy_cluster.json#/properties/local-myapp/properties/directResponseMessage")

### directResponseMessage Type

`string`

## gateway



`gateway`

* is optional

* Type: `object` ([gateway config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/gateway")

### gateway Type

`object` ([gateway config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema.md))

## healthChecks



`healthChecks`

* is optional

* Type: `object` ([healthChecks config schema](envoy_cluster-properties-local-myapp-config-schema-properties-healthchecks-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-healthchecks-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/healthChecks")

### healthChecks Type

`object` ([healthChecks config schema](envoy_cluster-properties-local-myapp-config-schema-properties-healthchecks-config-schema.md))

## idleTimeout



`idleTimeout`

* is optional

* Type: merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout.md "envoy_cluster.json#/properties/local-myapp/properties/idleTimeout")

### idleTimeout Type

merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout.md))

one (and only one) of

* [Untitled integer in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout-oneof-0.md "check type definition")

* [Untitled string in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-idletimeout-oneof-1.md "check type definition")

## path



`path`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-path.md "envoy_cluster.json#/properties/local-myapp/properties/path")

### path Type

`string`

## removeRequestHeaders



`removeRequestHeaders`

* is optional

* Type: `object` ([local-myapp remove request headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-request-headers-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-request-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/removeRequestHeaders")

### removeRequestHeaders Type

`object` ([local-myapp remove request headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-request-headers-config-schema.md))

## removeResponseHeaders



`removeResponseHeaders`

* is optional

* Type: `object` ([local-myapp remove response headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-response-headers-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-response-headers-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/removeResponseHeaders")

### removeResponseHeaders Type

`object` ([local-myapp remove response headers config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-remove-response-headers-config-schema.md))

## retryPolicy



`retryPolicy`

* is optional

* Type: `object` ([local-myapp retry policy config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-retry-policy-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-retry-policy-config-schema.md "envoy_cluster.json#/properties/local-myapp/properties/retryPolicy")

### retryPolicy Type

`object` ([local-myapp retry policy config schema](envoy_cluster-properties-local-myapp-config-schema-properties-local-myapp-retry-policy-config-schema.md))

## scheme



`scheme`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-scheme.md "envoy_cluster.json#/properties/local-myapp/properties/scheme")

### scheme Type

`string`

## timeout



`timeout`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-timeout.md "envoy_cluster.json#/properties/local-myapp/properties/timeout")

### timeout Type

`string`
