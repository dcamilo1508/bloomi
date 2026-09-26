-- ══════════════════════════════════════════════════════════════
--  BLOOMI — Fix RLS: permite lectura pública con anon key
--  Ejecuta esto en Supabase SQL Editor si el SA ve todo en 0
-- ══════════════════════════════════════════════════════════════

-- Desactivar RLS en tablas principales (permite anon key)
ALTER TABLE empresas    DISABLE ROW LEVEL SECURITY;
ALTER TABLE flores      DISABLE ROW LEVEL SECURITY;
ALTER TABLE pedidos     DISABLE ROW LEVEL SECURITY;
ALTER TABLE empleados   DISABLE ROW LEVEL SECURITY;
ALTER TABLE mensajes_chat DISABLE ROW LEVEL SECURITY;
ALTER TABLE reembolsos_bloomi DISABLE ROW LEVEL SECURITY;
ALTER TABLE colaboradores_sa  DISABLE ROW LEVEL SECURITY;
ALTER TABLE tareas_bloomi     DISABLE ROW LEVEL SECURITY;
ALTER TABLE notificaciones    DISABLE ROW LEVEL SECURITY;
ALTER TABLE suscripciones     DISABLE ROW LEVEL SECURITY;
ALTER TABLE liquidaciones     DISABLE ROW LEVEL SECURITY;
ALTER TABLE pagos             DISABLE ROW LEVEL SECURITY;
ALTER TABLE analytics_eventos DISABLE ROW LEVEL SECURITY;
ALTER TABLE ordenes_recurrentes DISABLE ROW LEVEL SECURITY;
ALTER TABLE alertas_precio    DISABLE ROW LEVEL SECURITY;
ALTER TABLE resenas           DISABLE ROW LEVEL SECURITY;
ALTER TABLE subastas          DISABLE ROW LEVEL SECURITY;
ALTER TABLE ofertas_subasta   DISABLE ROW LEVEL SECURITY;
ALTER TABLE log_actividad     DISABLE ROW LEVEL SECURITY;

-- Dar permisos completos al rol anon (llave pública)
GRANT ALL ON ALL TABLES IN SCHEMA public TO anon;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO anon;
GRANT ALL ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO authenticated;

-- Verificar que la tabla empresas tiene datos
SELECT id, nombre, tipo, estado, created_at 
FROM empresas 
ORDER BY created_at DESC 
LIMIT 10;
