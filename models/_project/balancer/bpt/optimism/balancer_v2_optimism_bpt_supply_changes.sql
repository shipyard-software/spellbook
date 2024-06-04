{% set blockchain = 'optimism' %}

{{
    config(
        schema = 'balancer_v2_optimism',
        alias = 'bpt_supply_changes', 
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['block_date', 'evt_tx_hash', 'evt_index', 'label'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.evt_block_time')]
    )
}}

{{ 
    bpt_supply_changes_macro(
        blockchain = blockchain,
        version = '2'
    )
}}