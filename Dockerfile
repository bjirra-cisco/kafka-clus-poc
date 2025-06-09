# Use official Kafka image from Bitnami
FROM bitnami/kafka:latest

# Set environment variables
ENV KAFKA_CFG_PROCESS_ROLES=broker,controller \
    KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@localhost:9093 \
    KAFKA_CFG_NODE_ID=0 \
    KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
    KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
    KAFKA_KRAFT_CLUSTER_ID=kraft-cluster-1

EXPOSE 9092

CMD ["kafka-server-start.sh", "/opt/bitnami/kafka/config/kraft/server.properties"]
