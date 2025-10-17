#!/bin/bash

clear
echo "🧪 Menú interactivo de simulación de alertas – Fase 4"
echo "----------------------------------------------------"
echo "1️⃣ Simular alertas en vivo"
echo "2️⃣ Resolver alertas simuladas"
echo "3️⃣ Ver estado actual de alertas"
echo "4️⃣ Salir"
echo "----------------------------------------------------"
read -p "Selecciona una opción [1-4]: " opcion

case $opcion in
  1)
    echo "🚨 Ejecutando simulación de alertas..."
    ./scripts/simular-alertas.sh
    ;;
  2)
    echo "✅ Ejecutando resolución de alertas..."
    ./scripts/resolver-alertas.sh
    ;;
  3)
    echo "📡 Estado actual de alertas:"
    curl -s http://localhost:9090/api/v1/alerts | jq '.data[] | {alertname: .labels.alertname, state: .state, instance: .labels.instance}'
    ;;
  4)
    echo "👋 Saliendo del menú. ¡Hasta la próxima!"
    exit 0
    ;;
  *)
    echo "❌ Opción inválida. Intenta nuevamente."
    ;;
esac

