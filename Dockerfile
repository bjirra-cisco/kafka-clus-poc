FROM bitnami/kafka:latest

ENV KAFKA_CFG_PROCESS_ROLES=broker,controller \
    KAFKA_CFG_NODE_ID=0 \
    KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
    KAFKA_CFG_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://0.0.0.0:9093 \
    KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://kafka-clus-poc.onrender.com:9092 \
    KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka-clus-poc.onrender.com:9093 \
    KAFKA_KRAFT_CLUSTER_ID=kraft-cluster-1

EXPOSE 9092

# ⛔️ DO NOT add this:
# CMD ["kafka-server-start.sh", "/opt/bitnami/kafka/config/kraft/server.properties"]

# ✅ Let Bitnami auto-run Kafka based on env vars
