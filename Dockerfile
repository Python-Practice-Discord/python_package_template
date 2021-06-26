FROM python@sha256:e8e000f3c551f93d7b03d241e38c1206eb8c8a1f1a6179902f74e068fc98ee59 as base

WORKDIR /opt

ARG USER_UID=1000
RUN adduser --shell /bin/sh --system --group --uid "${USER_UID}" default

RUN chown -R default /opt

USER default

ENV VIRTUAL_ENV=/opt/.venv
ENV PATH "$VIRTUAL_ENV/bin:/home/default/.local/bin:$PATH"


FROM base as builder

RUN pip install poetry
COPY --chown=default:default poetry.lock poetry.toml pyproject.toml ./
RUN poetry install

FROM base as final

COPY --chown=default:default --from=builder "$VIRTUAL_ENV" "$VIRTUAL_ENV"
COPY --chown=default:default . .

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD ["python", "src/project_template/main.py"]
