{{ config(
	tags=['legacy'],
    schema = 'tigris_arbitrum',
    alias = alias('events_options_open_position', legacy_model=True)
    )
}}

SELECT 
    1 as dummy