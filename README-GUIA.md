# 📘 README-GUIA.md – Workshop Fase 4: Exporters especializados + Alertas con Prometheus

---

## 🎯 Objetivo del workshop

Este workshop enseña cómo integrar **exporters especializados** (Node Exporter, Blackbox Exporter, cAdvisor), configurar **alertas con Prometheus + Alertmanager**, y visualizar todo en Grafana. Aprenderás a pasar de monitoreo pasivo a **observabilidad activa**, con reglas, notificaciones y dashboards reproducibles.

---

## 🔄 Diferencias con fases anteriores

| Fase | Enfoque | Herramientas | Tipo de dato |
|------|--------|--------------|--------------|
| Fase 1 | Métricas simuladas | Prometheus + Grafana | Aplicación |
| Fase 2 | Logs | Loki + Promtail + Grafana | Texto |
| Fase 3 | Métricas del sistema | Node Exporter + Prometheus + Grafana | Infraestructura |
| **Fase 4** | Exporters + Alertas | Prometheus + Alertmanager + Exporters + Grafana | Infra + Alertas |

---

## 📁 Estructura del repositorio

```bash
observabilidad-fase4-exporters-alertas-prometheus/
├── docker-compose.yml
├── .gitignore
├── README.md
├── README-GUIA.md
├── prometheus/
│   ├── prometheus.yml
│   └── alert.rules.yml
├── alertmanager/
│   └── config.yml
├── grafana/
│   ├── dashboards/
│   │   └── fase4/
│   │       ├── exporters.json
│   │       └── alertas.json
│   └── provisioning/
│       ├── datasources/
│       │   └── datasources.yml
│       └── dashboards/
│           └── dashboards.yml
├── scripts/
│   ├── setup.sh
│   └── reset.sh
├── docs/
│   └── arquitectura.md
├── assets/
│   └── capturas/
```

---

## 🚀 Cómo ejecutar el workshop paso a paso

```bash
git clone https://github.com/jgaragorry/observabilidad-fase4-exporters-alertas-prometheus.git
cd observabilidad-fase4-exporters-alertas-prometheus
./scripts/reset.sh
./scripts/setup.sh
```

Accede a:
- Prometheus: `http://localhost:9090`
- Alertmanager: `http://localhost:9093`
- Grafana: `http://localhost:3000` (usuario: admin / contraseña: admin)

---

## 🔧 Archivos explicados

### `docker-compose.yml`
Orquesta todos los servicios: Prometheus, Alertmanager, Node Exporter, Blackbox Exporter, cAdvisor, Grafana.

### `prometheus/prometheus.yml`
Define los targets de exporters y carga las reglas de alerta desde `alert.rules.yml`.

### `prometheus/alert.rules.yml`
Contiene alertas como:
- CPU alta
- Host caído
- Latencia de endpoints
- Contenedor sin memoria

### `alertmanager/config.yml`
Configura rutas de notificación (Slack, email, webhook), agrupación y silencios.

### `grafana/provisioning/datasources/datasources.yml`
Conecta Grafana con Prometheus como fuente de datos.

### `grafana/provisioning/dashboards/dashboards.yml`
Indica a Grafana dónde buscar los dashboards `.json`.

### `grafana/dashboards/fase4/exporters.json`
Dashboard para visualizar métricas de Node Exporter, Blackbox y cAdvisor.

### `grafana/dashboards/fase4/alertas.json`
Dashboard para visualizar alertas activas y estado de hosts.

### `scripts/setup.sh`
Levanta todos los servicios y verifica que estén corriendo.

### `scripts/reset.sh`
Elimina contenedores, volúmenes y redes para reiniciar el entorno.

### `.gitignore`
Excluye archivos temporales, credenciales y volúmenes persistentes.

---

## 📤 Exportar dashboards manualmente

1. Accede a Grafana: `http://localhost:3000`
2. Abre el dashboard que creaste
3. Haz clic en ⚙️ → Settings → JSON Model
4. Copia el JSON y guárdalo en `grafana/dashboards/fase4/`
5. Valida con:
   ```bash
   jq empty grafana/dashboards/fase4/exporters.json
   ```

---

## 📘 Guía PromQL + Alertas

### 🔍 Métricas clave

```promql
rate(node_cpu_seconds_total{mode!="idle"}[1m])
rate(node_network_receive_bytes_total[1m])
container_memory_usage_bytes
probe_success
```

### 🚨 Ejemplo de alerta

```yaml
- alert: CPUAlta
  expr: rate(node_cpu_seconds_total{mode!="idle"}[1m]) > 0.8
  for: 1m
  labels:
    severity: warning
  annotations:
    summary: "CPU alta en {{ $labels.instance }}"
```

---

## 🧪 Troubleshooting

- Prometheus sin targets → revisar `prometheus.yml`
- Alertas no disparan → revisar `alert.rules.yml` y `config.yml`
- Dashboards vacíos → revisar `datasources.yml` y `dashboards.yml`
- YAML mal indentado → validar con `yamllint`
- JSON mal formateado → validar con `jq`

---

## ❓ Preguntas frecuentes

- ¿Qué exporters se usan?
- ¿Cómo se simula una alerta?
- ¿Cómo se exporta un dashboard?
- ¿Cómo se reinicia el entorno?
- ¿Cómo se agrupan alertas en Alertmanager?

---

## 🧭 Arquitectura visual

```plaintext
[Node Exporter] ─┐
[Blackbox Exporter] ─┤
[cAdvisor] ──────────┼─> Prometheus ──> Alertmanager ──> Notificaciones
                     └─> Grafana ──> Dashboards
```

---

## ✅ Validación final

- Todos los exporters están integrados
- Las alertas están configuradas y disparan correctamente
- Los dashboards se cargan automáticamente
- El entorno es reproducible y didáctico

---

## 📲 Contacto y redes

🔗 LinkedIn: [linkedin.com/in/jgaragorry](https://linkedin.com/in/jgaragorry)  
🎵 TikTok: [tiktok.com/@softtraincorp](https://www.tiktok.com/@softtraincorp)  
📸 Instagram: [instagram.com/stclatam](https://www.instagram.com/stclatam/)  
💬 WhatsApp Comunidad: [bit.ly/whatsapp-observabilidad](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---

