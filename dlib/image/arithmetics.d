/*
Copyright (c) 2011-2017 Timur Gafarov

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
*/

module dlib.image.arithmetics;

private
{
    import dlib.image.image;
    import dlib.image.color;
}

SuperImage add(SuperImage a, SuperImage b, float t = 1.0f)
{
    return add(a, b, null, 1.0f);
}

SuperImage add(SuperImage a, SuperImage b, SuperImage outp, float t = 1.0f)
in
{
    assert(a.width == b.width);
    assert(a.height == b.height);
}
body
{
    SuperImage img;
    if (outp)
        img = outp;
    else
        img = a.dup;

    foreach(y; 0..img.height)
    foreach(x; 0..img.width)
    {
        Color4f acol = Color4f(a[x, y]);
        Color4f bcol = Color4f(b[x, y]);
        Color4f col  = acol + (bcol * t);
        img[x, y] = col;
        //a.updateProgress();
        //b.updateProgress();
    }

    //a.resetProgress();
    //b.resetProgress();

    return img;
}

SuperImage subtract(SuperImage a, SuperImage b, float t = 1.0f)
{
    return subtract(a, b, null, 1.0f);
}

SuperImage subtract(SuperImage a, SuperImage b, SuperImage outp, float t = 1.0f)
in
{
    assert(a.width == b.width);
    assert(a.height == b.height);
}
body
{
    SuperImage img;
    if (outp)
        img = outp;
    else
        img = a.dup;

    foreach(y; 0..img.height)
    foreach(x; 0..img.width)
    {
        Color4f acol = Color4f(a[x, y]);
        Color4f bcol = Color4f(b[x, y]);
        Color4f col  = acol - (bcol * t);
        img[x, y] = col;
        //a.updateProgress();
        //b.updateProgress();
    }

    //a.resetProgress();
    //b.resetProgress();

    return img;
}

SuperImage multiply(SuperImage a, SuperImage b, float t = 1.0f)
{
    return multiply(a, b, null, 1.0f);
}

SuperImage multiply(SuperImage a, SuperImage b, SuperImage outp, float t = 1.0f)
in
{
    assert(a.width == b.width);
    assert(a.height == b.height);
}
body
{
    SuperImage img;
    if (outp)
        img = outp;
    else
        img = a.dup;

    foreach(y; 0..img.height)
    foreach(x; 0..img.width)
    {
        Color4f acol = Color4f(a[x, y]);
        Color4f bcol = Color4f(b[x, y]);
        Color4f col  = acol * (bcol * t);
        img[x, y] = col;
        //a.updateProgress();
        //b.updateProgress();
    }

    //a.resetProgress();
    //b.resetProgress();

    return img;
}

SuperImage divide(SuperImage a, SuperImage b, float t = 1.0f)
{
    return divide(a, b, null, 1.0f);
}

SuperImage divide(SuperImage a, SuperImage b, SuperImage outp, float t = 1.0f)
in
{
    assert(a.width == b.width);
    assert(a.height == b.height);
}
body
{
    SuperImage img;
    if (outp)
        img = outp;
    else
        img = a.dup;

    foreach(y; 0..img.height)
    foreach(x; 0..img.width)
    {
        Color4f acol = Color4f(a[x, y]);
        Color4f bcol = Color4f(b[x, y]);
        Color4f col  = acol / (bcol * t);
        img[x, y] = col;
        //a.updateProgress();
        //b.updateProgress();
    }

    //a.resetProgress();
    //b.resetProgress();

    return img;
}

SuperImage invert(SuperImage a)
{
    return invert(a, null);
}

SuperImage invert(SuperImage a, SuperImage outp)
{
    SuperImage img;
    if (outp)
        img = outp;
    else
        img = a.dup;

    foreach(y; 0..img.height)
    foreach(x; 0..img.width)
    {
        img[x, y] = a[x, y].inverse;
        //a.updateProgress();
    }

    //a.resetProgress();

    return img;
}
