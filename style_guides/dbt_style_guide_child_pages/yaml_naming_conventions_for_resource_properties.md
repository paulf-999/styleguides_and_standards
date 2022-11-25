# YAML Naming Conventions & Style Guide for Resource Properties

:bulb: The purpose of this page is to describe the naming conventions used for (YAML) Resource Properties for dbt.

---

## Contents

1. YAML Naming Conventions
2. Style Guides
   1. YAML Style Guide
   2. dbt Source Style Guide

---

1. YAML Naming Conventions

* YAML files used for resource property configs should be prefixed with an underscore ( `_` ) to keep it at the top of the subdirectory.
* YAML files should be named with the convention `_<description>__<config>`, e.g., `_jaffle_shop__sources.yml`. Whereby:
  * `description` is typically the folder of models you're setting configurations for
    * E.g., `staging`, `marts`
  * `config` is the top-level resource you are configuring.
    * E.g., `docs`, `models`, `sources`

---

## 2. Style Guides

### 2.1. YAML Style Guide

**General Styles**

* Indents should use two spaces.
* Lines of YAML should be no longer than 80 characters.

**List Items**

* List items should be indented.
* Use a new line to separate list items that are dictionaries, where appropriate.
* List items should be listed alphabetically for ease of finding in larger files.
* Each top-level `configuration` should use a separate `.yml` file (i.e., sources, models), for example:

```bash
models
├── marts
└── staging
    └── ${DATA_SRC}
        ├── _${DATA_SRC}__models.yml
        ├── _${DATA_SRC}__sources.yml
        └── stg_${DATA_SRC}__cusomer.sql
```

**Example YAML**

```yaml

version: 2
models:

  - name: base_jaffle_shop__nations
    description: This model cleans the raw nations data
    columns:
      - name: nation_id
        tests:
          - unique
          - not_null

  - name: base_jaffle_shop__regions
    description: >
      This model cleans the raw regions data before being joined with nations
      data to create one cleaned locations table for use in marts.
    columns:
      - name: region_id
        tests:
          - unique
          - not_null

  - name: stg_jaffle_shop__locations
    description: "{{ doc('jaffle_shop_location_details') }}"columns:
      - name: location_sk
        tests:
          - unique
          - not_null

```

### 2.2. dbt Source Style Guide

* Resource properties for data sources** should be defined within a `_sources.yml` file.

**Source Table Identifiers**

* When working with source tables that use names that:
  * don't meet our usual naming conventions
  * or provide an unclear representation of their meaning
* We should use identifiers to override the reference to any source table names used (see [https://docs.getdbt.com/reference/resource-properties/identifier/](https://docs.getdbt.com/reference/resource-properties/identifier/)), e.g.:

```yaml

  # Good
  tables:
    - name: sk_qtr
      identifier: sap_sales_qtr

  # Bad
  tables:
    - name: sk_qtr

```

**Sensitive Data**

Columns that contain sensitive PII data (e.g., customer emails and names) or data that shouldn't be exposed should be marked as *sensitive* within the `_sources.yml` file.

This is done by using the `meta` key and setting sensitive equal to true, e.g.:

```yaml

  - name: sfdc_contact_source
    description: Source model for SFDC Contacts
    columns:
         - name: contact_id
           tests:
              - not_null
              - unique
         - name: contact_email
           meta:
              sensitive: true
         - name: contact_name
           meta:
              sensitive: true

```

<details>

**<summary>Background reading: how sensitive data is used for model processing (click to expand):</summary>**

* Two separate models are then created from the source model: a sensitive and non-sensitive model.
* The non-sensitive model uses a dbt macro called `hash_sensitive_columns` which takes the source table and hashes all of the columns with sensitive: true in the meta field. No specific join key is specified since all columns are hashed similarly. Another column can be added to this model as a joining key outside of the macro if needed. The `sfdc_contact` model is an excellent example. 2 columns are hashed, but an additional primary key of `contact_id` is specified.
* The dbt macro `nohash_sensitive_columns` is used in the sensitive model to create a joining key. The macro takes the source table and a column as the join key and returns the hashed column as the join key and the remaining columns unhashed.

</details>
