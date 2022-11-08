BEGIN;

UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8443', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'ws.client.address';
UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8444', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'ws.agent.address';
UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8443', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'infra.transfer.winrm.url';
UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8082/', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'monitor.customtrap.url';

-- for ver.7.0
UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8443', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'rest.client.address';
UPDATE setting.cc_hinemos_property
    SET value_string = 'https://0.0.0.0:8445', modify_user_id = 'hinemos', modify_datetime = EXTRACT(EPOCH FROM now()) * 1000
    WHERE property_key = 'rest.agent.address';

COMMIT;
