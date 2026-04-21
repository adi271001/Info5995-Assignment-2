.class public Lcom/example/mastg_test0019/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$0(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 4

    .line 26
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    .line 27
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v0, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    return-object p1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 22
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    invoke-static {p0}, Landroidx/activity/EdgeToEdge;->enable(Landroidx/activity/ComponentActivity;)V

    .line 24
    sget p1, Lcom/example/mastg_test0019/R$layout;->activity_main:I

    invoke-virtual {p0, p1}, Lcom/example/mastg_test0019/MainActivity;->setContentView(I)V

    .line 25
    sget p1, Lcom/example/mastg_test0019/R$id;->main:I

    invoke-virtual {p0, p1}, Lcom/example/mastg_test0019/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/example/mastg_test0019/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/example/mastg_test0019/MainActivity$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {p1, v0}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 30
    sget p1, Lcom/example/mastg_test0019/R$id;->webview:I

    invoke-virtual {p0, p1}, Lcom/example/mastg_test0019/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 31
    new-instance v0, Lcom/example/mastg_test0019/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/example/mastg_test0019/MainActivity$1;-><init>(Lcom/example/mastg_test0019/MainActivity;)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 38
    const-string v0, "http://www.example.com"

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 39
    new-instance p1, Lcom/example/mastg_test0019/MainActivity$2;

    invoke-direct {p1, p0}, Lcom/example/mastg_test0019/MainActivity$2;-><init>(Lcom/example/mastg_test0019/MainActivity;)V

    return-void
.end method
