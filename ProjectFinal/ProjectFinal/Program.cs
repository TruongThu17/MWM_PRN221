using AdminWebCore.Configurations.IdentityServer;
using NSwag;
using NSwag.Generation.Processors.Security;
using ProjectFinal.Models;

var builder = WebApplication.CreateBuilder(args);


// Add services to the container.
builder.Services.AddSingleton<MWMSystemContext>();
builder.Services.AddRazorPages();
builder.Services.AddControllers();


builder.Services.AddOpenApiDocument(config =>
{
    // Document name (default to: v1)
    config.DocumentName = "AdminWebCore";

    // Document / API version (default to: 1.0.0)
    config.Version = "1.0.0";

    // Document title (default to: My Title)
    config.Title = "AdminWebCore";

    // Document description
    config.Description = "AdminWebCore documentation";
});

builder.Services.AddAuthentication("Bearer")
        .AddJwtBearer("Bearer", options => {
            options.Authority = "https://localhost:44301";
            options.RequireHttpsMetadata = false;
        });

builder.Services.AddIdentityServer()
        .AddDeveloperSigningCredential() //not something we want to use in a production environment
        .AddInMemoryIdentityResources(InMemoryConfig.GetIdentityResources())
        .AddTestUsers(InMemoryConfig.GetUsers())
        .AddInMemoryClients(InMemoryConfig.GetClients());

builder.Services.AddSwaggerDocument(config => {
    config.DocumentProcessors.Add(new SecurityDefinitionAppender("JWT Token",
        new OpenApiSecurityScheme
        {
            Type = OpenApiSecuritySchemeType.ApiKey,
            Name = "Authorization",
            Description = "Copy 'Bearer ' + valid JWT token into field",
            In = OpenApiSecurityApiKeyLocation.Header
        }));
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapRazorPages();

app.Run();
