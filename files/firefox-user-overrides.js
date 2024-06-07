// user-overrides.js
//
// Firefox browser privacy overriden configs on top of
// https://github.com/arkenfox/user.js

// STARTUP
// Set startup page as the home page [ARKENFOX: 0 => blank]
//user_pref("browser.startup.page", 1);
// Set default starting page for home and new windows [ARKENFOX: about:blank]
//user_pref("browser.startup.homepage", "about:home");
// Enable starting page for new tabs [ARKENFOX: false => blank]
//user_pref("browser.newtabpage.enabled", true);

// DNS/DoH/PROXY/SOCKS
// Enable DNS over HTTPS [ARKENFOX: commented]
user_pref("network.trr.mode", 3);
// Set LibreDNS as provider [ARKENFOX: commented]
user_pref("network.trr.uri", "https://doh.libredns.gr/dns-query");
user_pref("network.trr.custom_uri", "https://doh.libredns.gr/dns-query");

// LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS
// Don't disable live search suggestions [ARKENFOX: both false]
//user_pref("browser.search.suggest.enabled", true);
//user_pref("browser.urlbar.suggest.searches", true);
// Don't disable tab-to-search [ARKENFOX: commented false]
//user_pref("browser.urlbar.suggest.engines", true);
// Disable urlbar clipboard suggestions [ARKENFOX: commented]
user_pref("browser.urlbar.clipboard.featureGate", false);

// DISK AVOIDANCE
// Don't disable disk cache [ARKENFOX: false]
//user_pref("browser.cache.disk.enable", true);

// DOWNLOADS
// Enable opening downloads panel on every download [ARKENFOX: false]
//user_pref("browser.download.alwaysOpenPanel", true);

// SHUTDOWN & SANITIZING
// Don't enable Firefox to clear items on shutdown [ARKENFOX: true]
//user_pref("privacy.sanitize.sanitizeOnShutdown", false);

// RESIST FINGERPRINTING
// Don't resist fingerprinting
// It is an all-or-nothing buy in: you cannot pick and choose what parts you want
// [ARKENFOX: true]
//user_pref("privacy.resistFingerprinting", false);
// [ARKENFOX: true]
//user_pref("privacy.resistFingerprinting.letterboxing", false);
// [ARKENFOX: true]
//user_pref("webgl.disabled", false);

// OPTIONAL OPSEC
// Start private browsing by default [ARKENFOX: commented]
user_pref("browser.privatebrowsing.autostart", true);
// Disable saving passwords [ARKENFOX: commented]
user_pref("signon.rememberSignons", false);
// Disable location bar suggestion types [ARKENFOX: commented]
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);
// Disable form autofill [ARKENFOX: commented]
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
// Disable page thumbnail collection [ARKENFOX: commented]
user_pref("browser.pagethumbnails.capturing_disabled", true);
// Disable location bar using search [ARKENFOX: commented]
user_pref("keyword.enabled", false);

// OPTIONAL HARDENING
// Don't disable DRM content [ARKENFOX: false]
//user_pref("media.eme.enabled", true);
// Don't disable IPv6 [ARKENFOX: true]
//user_pref("network.dns.disableIPv6", false);

// ADDITIONALS
// Never display the bookmarks toolbar
user_pref("browser.toolbars.bookmarks.visibility", "never");
// Make Ctrl+Tab switch between current and last viewed tab
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
// Disable search bar in new tab page
user_pref("browser.newtabpage.activity-stream.showSearch", false);
// Display maximum top sites
user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);
// Use the address bar for search
user_pref("browser.search.widget.inNavBar", false);
// Always show tab list in tab bar
user_pref("browser.tabs.tabmanager.enabled", true);
// Do not unload tabs
user_pref("browser.tabs.unloadOnLowMemory", false);
// Activate compact ui density
user_pref("browser.uidensity", 1);
// Dock devtools to the right
user_pref("devtools.toolbox.host", "right");
// Activate the dark theme
user_pref("extensions.activeThemeID" , "firefox-compact-dark@mozilla.org");
// Set dark theme for reader
user_pref("reader.color_scheme", "dark");
// Set reader line width
user_pref("reader.content_width", 9);
// Set reader font
user_pref("reader.font_type", "serif");
// Fix right mouse instant first option context menu clicks in window managers
user_pref("ui.context_menus.after_mouseup", true);
// Enable GTK+ client side decoration
user_pref("ui.GtkCSDAvailable", 1);
// Disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);
// Disable pocket
user_pref("extensions.pocket.enabled", false);
// Disable "Recommended by Pocket" in new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
// Disable alt key toggling the menu bar
user_pref("ui.key.menuAccessKey", 0);
// Do not auto-hide the download button
user_pref("browser.download.autohideButton" , false);
// Display all parts of the url in the location bar
user_pref("browser.urlbar.trimURLs", false);
// Enable VA-API with ffmpeg for hardware acceleration
user_pref("media.ffmpeg.vaapi.enabled", true);
// Disable unsupported AV1 codecs
user_pref("media.av1.enabled", false);

