# Maintainer: Paul Colomiets <pc@gafol.net>

pkgname=libwebsite
pkgver=${VERSION}
pkgrel=1
pkgdesc="An http/websocket protocol implementation for fast web servers"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/libwebsite"
license=('MIT')
depends=('libev' 'openssl')
makedepends=('python3' 'cunit')
source=(https://github.com/downloads/tailhook/libwebsite/$pkgname-$pkgver.tar.bz2)
md5sums=('${DIST_MD5}')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd $srcdir/$pkgname-$pkgver
  ./waf test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
