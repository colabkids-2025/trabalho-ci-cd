FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS builder
WORKDIR /colabkidsApp
COPY . .
ENV ASPNETCORE_ENVIRONMENT Development
ENV URLS http://0.0.0.0:80
RUN dotnet publish -c Release -o build /colabkidsApp/ColabkidsApp.csproj

FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS runner
WORKDIR /colabkidsApp
COPY --from=builder /colabkidsApp/build /colabkidsApp/
EXPOSE 80
ENTRYPOINT ["dotnet", "/colabkidsApp/ColabkidsApp.dll"] 