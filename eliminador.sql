BEGIN
    -- Eliminar vistas
    FOR v IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW "' || v.view_name || '"';
    END LOOP;

    -- Eliminar triggers
    FOR t IN (SELECT trigger_name FROM user_triggers) LOOP
        EXECUTE IMMEDIATE 'DROP TRIGGER "' || t.trigger_name || '"';
    END LOOP;

    -- Eliminar secuencias
    FOR s IN (SELECT sequence_name FROM user_sequences) LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE "' || s.sequence_name || '"';
    END LOOP;

    -- Eliminar tablas
    FOR tb IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE "' || tb.table_name || '" CASCADE CONSTRAINTS';
    END LOOP;
END;
/
