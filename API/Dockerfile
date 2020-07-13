FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
COPY API_Final /app
WORKDIR /app
VOLUME /app/wwwwroot
EXPOSE 80/TCP
ENTRYPOINT ["dotnet","PaulosAuto.API.dll"]