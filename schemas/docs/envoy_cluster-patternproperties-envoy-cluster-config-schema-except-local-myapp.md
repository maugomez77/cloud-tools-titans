# envoy cluster config schema (except local-myapp) Schema

```txt
envoy_cluster.json#/patternProperties/^(?!local-myapp$)[a-zA-Z_-]+
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [envoy\_cluster.json\*](../out/envoy_cluster.json "open original schema") |

## ^(?!local-myapp$)\[a-zA-Z\_-]+ Type

`object` ([envoy cluster config schema (except local-myapp)](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp.md))

# ^(?!local-myapp$)\[a-zA-Z\_-]+ Properties

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                   |
| :---------------------------- | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [address](#address)           | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-address.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/address")                                 |
| [healthChecks](#healthchecks) | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-healthchecks-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/healthChecks") |
| [idleTimeout](#idletimeout)   | Merged   | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/idleTimeout")                         |
| [path](#path)                 | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-path.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/path")                                       |
| [retryPolicy](#retrypolicy)   | `object` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-retry-policy-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/retryPolicy")  |
| [routes](#routes)             | `array`  | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-routes-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/routes")             |
| [scheme](#scheme)             | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-scheme.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/scheme")                                   |
| [timeout](#timeout)           | `string` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-timeout.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/timeout")                                 |

## address



`address`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-address.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/address")

### address Type

`string`

## healthChecks



`healthChecks`

* is optional

* Type: `object` ([cluster healthChecks config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-healthchecks-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-healthchecks-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/healthChecks")

### healthChecks Type

`object` ([cluster healthChecks config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-healthchecks-config-schema.md))

## idleTimeout



`idleTimeout`

* is optional

* Type: merged type ([Details](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/idleTimeout")

### idleTimeout Type

merged type ([Details](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout.md))

one (and only one) of

* [Untitled integer in envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout-oneof-0.md "check type definition")

* [Untitled string in envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-idletimeout-oneof-1.md "check type definition")

## path



`path`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-path.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/path")

### path Type

`string`

## retryPolicy



`retryPolicy`

* is optional

* Type: `object` ([cluster retry policy config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-retry-policy-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-retry-policy-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/retryPolicy")

### retryPolicy Type

`object` ([cluster retry policy config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-retry-policy-config-schema.md))

## routes



`routes`

* is optional

* Type: `object[]` ([envoy cluster route config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-routes-config-schema-envoy-cluster-route-config-schema.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-routes-config-schema.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/routes")

### routes Type

`object[]` ([envoy cluster route config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-cluster-routes-config-schema-envoy-cluster-route-config-schema.md))

## scheme



`scheme`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-scheme.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/scheme")

### scheme Type

`string`

## timeout



`timeout`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-patternproperties-envoy-cluster-config-schema-except-local-myapp-properties-timeout.md "envoy_cluster.json#/patternProperties/^(?!local-myapp$)\[a-zA-Z_-]+/properties/timeout")

### timeout Type

`string`
