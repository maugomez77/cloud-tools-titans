# gateway config schema Schema

```txt
envoy_cluster.json#/properties/local-myapp/properties/gateway
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [envoy\_cluster.json\*](../out/envoy_cluster.json "open original schema") |

## gateway Type

`object` ([gateway config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema.md))

# gateway Properties

| Property                          | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                |
| :-------------------------------- | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [defaultBackend](#defaultbackend) | `string`  | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-defaultbackend.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/defaultBackend") |
| [enabled](#enabled)               | `boolean` | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-enabled.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/enabled")               |
| [port](#port)                     | Merged    | Optional | cannot be null | [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/port")                     |

## defaultBackend



`defaultBackend`

* is optional

* Type: `string`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-defaultbackend.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/defaultBackend")

### defaultBackend Type

`string`

## enabled



`enabled`

* is optional

* Type: `boolean`

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-enabled.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/enabled")

### enabled Type

`boolean`

## port



`port`

* is optional

* Type: merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port.md))

* cannot be null

* defined in: [envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port.md "envoy_cluster.json#/properties/local-myapp/properties/gateway/properties/port")

### port Type

merged type ([Details](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port.md))

one (and only one) of

* [Untitled integer in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port-oneof-0.md "check type definition")

* [Untitled string in envoy cluster config schema](envoy_cluster-properties-local-myapp-config-schema-properties-gateway-config-schema-properties-port-oneof-1.md "check type definition")
