'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "7a333ce92e0b8356eae2630fca52eb5e",
"assets/NOTICES": "692c96e36d3f4303049c0c1c345a0d2f",
"assets/assets/Level5/level_5_down_right.png": "5ab9bbf2b18f81d579502a24e59cb756",
"assets/assets/Level5/level_5_up_right.png": "4e62d0e57e55df9c083c44fe51ffd4b5",
"assets/assets/Level5/level_5_down_left.png": "e3ab59e5406a558a016ab8776969bd45",
"assets/assets/Level5/level_5_up_down.png": "1daa677c78d14e215570b43dfdc5064d",
"assets/assets/Level5/guard_room.png": "95648a8ffff69f71e7f855fa0a286e1d",
"assets/assets/Level5/level_5_left_right.png": "a2a234f22016f0fc228b650b40b56703",
"assets/assets/Level5/level_5_up_left.png": "17b3d5551bc5c8a6c2bc8bfd72c23bdf",
"assets/assets/Level1/FI_L1_left_right_finished.png": "942d8d2649f7f71731fbbeae0d122077",
"assets/assets/Level1/F1_L1_up_down_finished.png": "4a5328a52883988823839bf27c5e6e6c",
"assets/assets/Level1/FI_L1_down_right.png": "2594abd4cc3e9ad56ae1ecb8a331fe4a",
"assets/assets/Level1/FI_L1_up_left_finished.png": "68e34ba5bc8135fc8c7adc242c48e458",
"assets/assets/Fallen_Sophia.png": "2141779110e5f72971b04d6d947d5fbc",
"assets/assets/Level2/level_2_left_right.png": "8d58571b8f922d049e4e8371565effdc",
"assets/assets/Level2/level%25202%2520guard%2520room.png": "3647be90bbd2663c6fd5ae60dc5dc318",
"assets/assets/Level2/level_2_up_left.png": "b7ee4d161a53ba7e8465b6901d403d0d",
"assets/assets/Level2/level_2_up_down.png": "3c10ce908a97cca9fdb05a0d08b1c124",
"assets/assets/Level2/level_2_down_right.png": "904f2251bcd67b704d53493ba611b68b",
"assets/assets/Level2/level_2_down_left.png": "4b537cdada8ed6b6d5d80c93c461229b",
"assets/assets/Level2/level_2_up_right.png": "9019f22c39bbd1ea7a804c0e55113d7e",
"assets/assets/goal_room.png": "9bb4ee6e3e27b38a4818615c071cdcb6",
"assets/assets/Level4/level_4_up_right.png": "c431523934fa7a8f7a7214e510e13b16",
"assets/assets/Level4/level_4_down_right.png": "6c0cb7af48572ef81bdedddc15259ddb",
"assets/assets/Level4/level_4_up_left.png": "b43431f8098abc85f50de6f3a5251075",
"assets/assets/Level4/level_4_left_right.png": "2efb9c037729e648b68dc727919aa991",
"assets/assets/Level4/guard_room.png": "322e76a1d9ebba7ab1d57de63aa5a836",
"assets/assets/Level4/level_4_up_down.png": "7bfa4ad1a18864575811565daf3684db",
"assets/assets/Level4/level_4_down_left.png": "9135dc679e35a6fd2342b83d2ecea5ce",
"assets/assets/Level3/level_3_up_down.png": "7a481087a02c701360bbee9bfe5d0e30",
"assets/assets/Level3/level_3_left_right.png": "3ef83cd499a57b84756e0974e305bbfc",
"assets/assets/Level3/level_3_down_right.png": "5ae31cc112ef4a314f746cc50507c9ea",
"assets/assets/Level3/guard_room.png": "bcdcf7a75da35e3981bced28b3784a87",
"assets/assets/Level3/level_3_up_left.png": "1331cfc5807fceb4b2fdd617e6d383fd",
"assets/assets/Level3/level_3_up_right.png": "32c1c5f010253ec22d170670e616368d",
"assets/assets/Level3/level_3_down_left.png": "a11800e1d2d1bbeaa4febd5617d1f68b",
"assets/assets/F1_background.png": "6b9b37cb2709dbabd37552593c77d3f2",
"assets/assets/MiniArella/arella_mini_forwards_1.png": "3e3be03f443534098547bba6d2449fe4",
"assets/assets/Fallen_Arella.png": "e582e8d8c47a773cc2efdf4635ab6afc",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "7dd37ea2d10bd1a28e59f68668990c11",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"index.html": "e6f56333d7ed53f45a19f54262024a16",
"/": "e6f56333d7ed53f45a19f54262024a16",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "d271957f58f2c9fcf4be9a26f77080f4",
"main.dart.js": "a0822a1ac9121dabdfbec13084458c39",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
