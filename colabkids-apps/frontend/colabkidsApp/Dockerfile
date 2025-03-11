FROM node:21-alpine3.18 AS builder
WORKDIR /colabkidsApp
COPY . .
RUN npm ci --silent
RUN npm run build
RUN npm prune --omit=dev

FROM node:21-alpine3.18 AS runner
WORKDIR /colabkidsApp

COPY --from=builder /colabkidsApp/.next /colabkidsApp/.next
COPY --from=builder /colabkidsApp/node_modules /colabkidsApp/node_modules
COPY --from=builder /colabkidsApp/package.json /colabkidsApp/
COPY --from=builder /colabkidsApp/public /colabkidsApp/public

ENV PORT 80
EXPOSE 80

ENTRYPOINT ["npm", "start"]

