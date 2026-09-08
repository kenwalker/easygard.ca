// Bump this version any time you want every client to discard their cache
// and re-download everything (equivalent to changing the AppCache manifest
// comment). Browsers re-fetch this file on each navigation; if any byte
// here changes, the SW is treated as a new version, runs install/activate,
// and deletes old caches before serving requests from the new one.
const CACHE_VERSION = 'easygard-v1.0.73';

const PRECACHE_URLS = [
  '/',
  '/index.html',
  '/apple-touch-iphone.png',
  '/lib/jquery.mobile-1.4.5.min.css',
  '/lib/jquery.mobile-1.4.5.min.js',
  '/lib/jquery.min.js',
  '/lib/jqm-demos.css',
  '/lib/index.js',
  '/lib/images/ajax-loader.gif',
  '/images/shield.png',
  '/about/',
  '/changes/',
  '/armor/',
  '/classes/',
  '/combat/',
  '/enchantments/',
  '/enchantments/self',
  '/enchantments/all',
  '/enchantments/touch',
  '/enchantments/protection',
  '/enchantments/flame',
  '/enchantments/death',
  '/enchantments/sorcery',
  '/enchantments/spirit',
  '/enchantments/yellow',
  '/enchantments/white',
  '/enchantments/red',
  '/reeves/',
  '/shields/',
  '/spells/',
  '/spells/all',
  '/spells/balls',
  '/spells/definitions',
  '/spells/self',
  '/spells/touch',
  '/spells/verbal',
  '/spells/a', '/spells/b', '/spells/c', '/spells/d', '/spells/e',
  '/spells/f', '/spells/g', '/spells/h', '/spells/i', '/spells/l',
  '/spells/m', '/spells/n', '/spells/p', '/spells/r', '/spells/s',
  '/spells/t', '/spells/u', '/spells/v', '/spells/w',
  '/states/',
  '/weapons/',
  '/battlegames/',
  '/battlegames/all',
  '/battlegamesby/a', '/battlegamesby/b', '/battlegamesby/c',
  '/battlegamesby/d', '/battlegamesby/e', '/battlegamesby/f',
  '/battlegamesby/g', '/battlegamesby/h', '/battlegamesby/k',
  '/battlegamesby/l', '/battlegamesby/m', '/battlegamesby/p',
  '/battlegamesby/r', '/battlegamesby/s', '/battlegamesby/t',
  '/battlegames/class',
  '/battlegames/militia',
  '/battlegames/ditch',
  '/phoenixball/',
  '/codeofconduct/'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_VERSION).then((cache) => cache.addAll(PRECACHE_URLS))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys()
      .then((names) => Promise.all(
        names.filter((n) => n !== CACHE_VERSION).map((n) => caches.delete(n))
      ))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (event) => {
  const request = event.request;
  if (request.method !== 'GET') return;

  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return;

  event.respondWith(
    caches.match(request).then((cached) => {
      const fetchAndUpdate = fetch(request).then((response) => {
        if (response && response.ok && response.type === 'basic') {
          const copy = response.clone();
          caches.open(CACHE_VERSION).then((cache) => cache.put(request, copy));
        }
        return response;
      }).catch(() => cached);

      return cached || fetchAndUpdate;
    })
  );
});
