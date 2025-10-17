#!/bin/bash
echo "🧹 Reiniciando entorno Fase 4..."
docker-compose down -v
docker system prune -f
echo "✅ Entorno limpio."

