'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "5bbaa19bc17faabbdd9d77f1cebfb6fa",
"index.html": "a3db59d0dd946cbf7d5720703e663d9c",
"/": "a3db59d0dd946cbf7d5720703e663d9c",
"main.dart.js": "341e75bfead7e075d4e10b4111d3fcb4",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "9a59c0acfff0485a6d34a1ce8567618c",
"icons/Icon-192.png": "06f66048be6004353de523b0ca52f05d",
"icons/Icon-maskable-192.png": "06f66048be6004353de523b0ca52f05d",
"icons/Icon-maskable-512.png": "51bd3480857813e69698d00900e13e40",
"icons/Icon-512.png": "51bd3480857813e69698d00900e13e40",
"manifest.json": "92fb512276adaf500ad48c1df70072d7",
"assets/AssetManifest.json": "6b1f5f1484376f89a514b1c06ca61ceb",
"assets/NOTICES": "15c2c4b148fe756adc6adc44152bdfa6",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "6685fc960cf2de2c08a089bd1f19dc9a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "6bcd23a4e71d18e0dd536f9e5a582d73",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "e1179d059a43a358983e8be286b85af8",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/fake.jpeg": "1e538fcaac8991580e6cbfd5dafa24dc",
"assets/assets/me.jpg": "4db985a79c449f8a11a501a7356e5936",
"assets/assets/deraya/de4.jpeg": "b69d9cb9a03984053ea97b16607af152",
"assets/assets/deraya/de3.jpeg": "1290c94d500ea985f5500755b7a27c9e",
"assets/assets/deraya/de2.jpeg": "1b91101657f686202b0bfe63b02f2c71",
"assets/assets/deraya/de1.jpeg": "b0e422130d3516e27b47d984c6b8bcb8",
"assets/assets/Mustafa%2520Ibrahim%2520Resume.pdf": "1f0449428cf9c4ab6fb92d3cd98c8fda",
"assets/assets/lemon/le2.jpeg": "8f25f67ceba54f41246d041b8be1c947",
"assets/assets/lemon/le3.jpeg": "4ef184c792f3bb06073fa8d989615415",
"assets/assets/lemon/le4.jpeg": "fc2ad0703d632955c37dec43fb3c943a",
"assets/assets/lemon/le5.jpeg": "67809dc56e234546e93dd1bbcdb1407b",
"assets/assets/lemon/le6.jpeg": "765bbb7a6d2ccb9acd7d215f15121de4",
"assets/assets/lemon/le7.jpeg": "2516d2337b7e77748bebd402a26a3e01",
"assets/assets/lemon/le1.jpeg": "3911fa01367d805ed7631b82069d276c",
"assets/assets/we/we1.jpg": "0cd9bec34a80c7b94fc07726be01d40a",
"assets/assets/we/we2.jpg": "4b6fd9ad58e3080e5afb6de37b9f5de1",
"assets/assets/we/we3.jpg": "62ec838b5545b0697ecfa015e7c421fc",
"assets/assets/we/we4.jpg": "bb26bab32610d965841b0b0914e357a1",
"assets/assets/bund/bund2.png": "cefbfe232348292ff8f73180700fccf0",
"assets/assets/bund/bund3.png": "a518bd9f825f6e85cf937bb5dd2461b5",
"assets/assets/bund/bund1.png": "464a19e99bf22cc18cb7c21e6e01b298",
"assets/assets/bund/bund4.png": "767ad6f367ff4f02b07b3882eac7e23f",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
