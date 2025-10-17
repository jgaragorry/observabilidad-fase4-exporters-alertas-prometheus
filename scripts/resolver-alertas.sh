#!/bin/bash

echo "✅ Revirtiendo simulación de alertas..."

# 1. Restaurar target original de Blackbox Exporter
echo "🔧 Restaurando target de Blackbox Exporter..."
sed -i 's|http://10.255.255.1|http://example.com|g' prometheus/prometheus.yml

# 2. Reiniciar contenedores detenidos
echo "🚀 Iniciando node-exporter y cadvisor..."
docker start node-exporter cadvisor

# 3. Restaurar umbral original de alerta CPUAlta
echo "🧠 Restaurando umbral original de CPUAlta..."
sed -i 's/> 0.01/> 0.8/g' prometheus/alert.rules.yml

# 4. Recargar configuración de Prometheus
echo "🔄 Recargando configuración de Prometheus..."
docker exec prometheus kill -HUP 1

# 5. Esperar y mostrar estado
echo "⏳ Esperando 60 segundos para que las alertas se resuelvan..."
sleep 60

echo "📡 Estado actual de alertas:"
curl -s http://localhost:9090/api/v1/alerts | jq '.data[] | {alertname: .labels.alertname, state: .state, instance: .labels.instance}'

echo "✅ Resolución de alertas completada. Verifica en Grafana el dashboard de historial."

