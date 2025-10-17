#!/bin/bash

echo "🔍 Verificando estructura del Workshop Fase 4..."

# 1. Verificar existencia de archivos clave
archivos=(
  "docker-compose.yml"
  "prometheus/prometheus.yml"
  "prometheus/alert.rules.yml"
  "alertmanager/config.yml"
  "grafana/provisioning/datasources/datasources.yml"
  "grafana/provisioning/dashboards/dashboards.yml"
  "grafana/dashboards/fase4/exporters.json"
  "grafana/dashboards/fase4/alertas.json"
  "grafana/dashboards/fase4/diagnostico.json"
  "grafana/dashboards/fase4/latencia-hosts.json"
  "grafana/dashboards/fase4/alertas-tiempo-real.json"
  "grafana/dashboards/fase4/alertas-historial.json"
  "grafana/dashboards/fase4/alertas-timeline-heatmap.json"
  "scripts/setup.sh"
  "scripts/reset.sh"
  "scripts/simular-alertas.sh"
  "scripts/resolver-alertas.sh"
  "scripts/menu-alertas.sh"
)

echo "📁 Verificando archivos..."
for archivo in "${archivos[@]}"; do
  if [ -f "$archivo" ]; then
    echo "✅ Existe: $archivo"
  else
    echo "❌ Falta: $archivo"
  fi
done

# 2. Verificar contenido clave en archivos YAML
echo "🔎 Verificando contenido de configuración..."

grep -q "alertmanagers:" prometheus/prometheus.yml && echo "✅ Prometheus tiene bloque de alertmanagers" || echo "❌ Falta bloque de alertmanagers en prometheus.yml"
grep -q "groups:" prometheus/alert.rules.yml && echo "✅ alert.rules.yml tiene grupos de reglas" || echo "❌ Falta bloque de grupos en alert.rules.yml"
grep -q "receivers:" alertmanager/config.yml && echo "✅ Alertmanager tiene receptores configurados" || echo "❌ Falta bloque de receivers en config.yml"

# 3. Verificar dashboards JSON válidos
echo "🧪 Validando formato JSON de dashboards..."
for json in grafana/dashboards/fase4/*.json; do
  jq empty "$json" 2>/dev/null && echo "✅ JSON válido: $json" || echo "❌ JSON inválido: $json"
done

# 4. Verificar permisos de ejecución en scripts
echo "🔐 Verificando permisos de ejecución..."
for script in scripts/*.sh; do
  if [ -x "$script" ]; then
    echo "✅ Ejecutable: $script"
  else
    echo "❌ No ejecutable: $script → Soluciona con: chmod +x $script"
  fi
done

echo "📦 Verificación completa. Revisa los ❌ para corregir y asegurar reproducibilidad."

