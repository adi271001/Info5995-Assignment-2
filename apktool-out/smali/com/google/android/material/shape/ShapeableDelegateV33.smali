.class Lcom/google/android/material/shape/ShapeableDelegateV33;
.super Lcom/google/android/material/shape/ShapeableDelegate;
.source "ShapeableDelegateV33.java"


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/google/android/material/shape/ShapeableDelegate;-><init>()V

    .line 40
    invoke-direct {p0, p1}, Lcom/google/android/material/shape/ShapeableDelegateV33;->initMaskOutlineProvider(Landroid/view/View;)V

    return-void
.end method

.method private initMaskOutlineProvider(Landroid/view/View;)V
    .locals 1

    .line 60
    new-instance v0, Lcom/google/android/material/shape/ShapeableDelegateV33$1;

    invoke-direct {v0, p0}, Lcom/google/android/material/shape/ShapeableDelegateV33$1;-><init>(Lcom/google/android/material/shape/ShapeableDelegateV33;)V

    invoke-static {p1, v0}, Lcom/google/android/material/chip/Chip$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Landroid/view/ViewOutlineProvider;)V

    return-void
.end method


# virtual methods
.method invalidateClippingMethod(Landroid/view/View;)V
    .locals 1

    .line 50
    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapeableDelegateV33;->shouldUseCompatClipping()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p1, v0}, Lcom/google/android/material/chip/Chip$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;Z)V

    .line 51
    invoke-virtual {p0}, Lcom/google/android/material/shape/ShapeableDelegateV33;->shouldUseCompatClipping()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    goto :goto_0

    .line 54
    :cond_0
    invoke-static {p1}, Lkotlin/io/path/PathTreeWalk$$ExternalSyntheticApiModelOutline0;->m(Landroid/view/View;)V

    :goto_0
    return-void
.end method

.method shouldUseCompatClipping()Z
    .locals 1

    .line 45
    iget-boolean v0, p0, Lcom/google/android/material/shape/ShapeableDelegateV33;->forceCompatClippingEnabled:Z

    return v0
.end method
