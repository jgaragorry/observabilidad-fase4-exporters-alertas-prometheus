# 🚨 Workshop Fase 4 – Exporters + Alertas con Prometheus y Alertmanager

Este repositorio forma parte de la serie de workshops de observabilidad. En esta Fase 4 aprenderás a:

- Integrar **exporters especializados**: Node Exporter, Blackbox Exporter, cAdvisor  
- Configurar **alertas reales** con Prometheus + Alertmanager  
- Visualizar alertas en **Grafana** con dashboards automáticos  
- Simular y resolver alertas con scripts reproducibles  
- Enseñar y compartir buenas prácticas de monitoreo

---

## 🚀 ¿Cómo empezar?

```bash
git clone https://github.com/jgaragorry/observabilidad-fase4-exporters-alertas-prometheus.git
cd observabilidad-fase4-exporters-alertas-prometheus
./scripts/setup.sh
```

Luego accede a:

- Prometheus → http://localhost:9090  
- Grafana → http://localhost:3000 (usuario: admin / admin)  
- Alertmanager → http://localhost:9093

---

## 🧪 Simulación de alertas

Usa el menú interactivo para disparar y resolver alertas:

```bash
./scripts/menu-alertas.sh
```

---

## 📊 Dashboards incluidos

- Exporters (CPU, memoria, disco, red)
- Latencia y disponibilidad de hosts
- Alertas activas y resueltas
- Timeline y heatmap de alertas

---

## 📚 Guía completa

Consulta el archivo [`README-GUIA.md`](./README-GUIA.md) para:

- Explicaciones didácticas
- Arquitectura del entorno
- PromQL comentado
- Slides y visuales para clases

---

## 📸 Miniatura sugerida

![Miniatura](https://raw.githubusercontent.com/jgaragorry/observabilidad-fase4-exporters-alertas-prometheus/main/.github/assets/fase4-miniatura.png)

---

## 📣 Comparte y enseña

Este workshop está diseñado para ser enseñado, compartido y adaptado.  
Si lo usas en clases o redes, ¡etiquétame y comparte tu experiencia!

---

