#!/bin/bash

echo "🚨 Simulando alertas en vivo para Workshop Fase 4..."

# 1. Simular endpoint caído (Blackbox)
echo "🔧 Modificando target de Blackbox Exporter..."
sed -i 's|http://example.com|http://10.255.255.1|g' prometheus/prometheus.yml

# 2. Simular caída de hosts
echo "🧨 Deteniendo node-exporter y cadvisor..."
docker stop node-exporter cadvisor

# 3. Simular CPU alta (bajamos el umbral en alert.rules.yml)
echo "🔥 Ajustando umbral de CPUAlta..."
sed -i 's/> 0.8/> 0.01/g' prometheus/alert.rules.yml

# 4. Reiniciar Prometheus para aplicar cambios
echo "🔄 Reiniciando Prometheus..."
docker exec prometheus kill -HUP 1

# 5. Esperar y mostrar estado
echo "⏳ Esperando 60 segundos para que se disparen las alertas..."
sleep 60

echo "📡 Estado de alertas en Prometheus:"
curl -s http://localhost:9090/api/v1/alerts | jq '.data[] | {alertname: .labels.alertname, state: .state, instance: .labels.instance}'

echo "✅ Simulación completada. Verifica en Grafana los dashboards de alertas activas, historial y timeline."

