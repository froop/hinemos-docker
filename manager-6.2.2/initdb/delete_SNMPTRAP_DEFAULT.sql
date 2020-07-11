BEGIN;

DELETE FROM setting.cc_object_privilege WHERE object_id='SNMPTRAP_DEFAULT';
DELETE FROM setting.cc_monitor_info WHERE monitor_id='SNMPTRAP_DEFAULT';
TRUNCATE TABLE setting.cc_monitor_trap_info CASCADE;

COMMIT;
