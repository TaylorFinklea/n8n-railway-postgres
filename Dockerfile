FROM docker.n8n.io/n8nio/n8n:latest

# Set environment variables for timezone (optional)
ENV TZ=UTC
ENV GENERIC_TIMEZONE=UTC

# Environment variable to allow the workflow execution to be persisted
ENV EXECUTIONS_PROCESS=main
ENV EXECUTIONS_MODE=regular

# We don't need to copy any files since we're directly using the n8n image
# COPY . .

# Default command is already set in the n8n image
# No need to specify it again unless you want to override
