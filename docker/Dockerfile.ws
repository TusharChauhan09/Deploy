FROM oven/bun:1

WORKDIR /usr/src/app

#COPY package* ./   # can't able to as there are multiple package.json's
#RUN bun install

COPY bun.lockb package.json turbo.json ./

COPY ./packages ./packages

COPY apps/ws ./apps/ws

#COPY . .
RUN bun install
# for prisma genrate : script
RUN bun run db:generate

EXPOSE 3001

CMD ["bun","run","start:ws"];