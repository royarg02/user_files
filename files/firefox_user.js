/// USER.JS
///
/// Firefox browser privacy configs
/// Preferences taken from https://github.com/arkenfox/user.js

/// MAYBE CHANGE THESE

/// Disable top sites
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

/// Always display the bookmarks toolbar
//user_pref("browser.toolbars.bookmarks.visibility", "always");

/// Don't provide search suggestions
user_pref("browser.search.suggest.enabled", false);

/// Don't suggest search engines
user_pref("browser.urlbar.suggest.engines", false);

/// Disable storing extra session data(logins)
user_pref("browser.sessionstore.privacy_level", 2);

/// Enable DRM content
//user_pref("media.eme.enabled", true);

/// Start private browsing by default
user_pref("browser.privatebrowsing.autostart", true);

/// Don't suggest browsing history
user_pref("browser.urlbar.suggest.history", false);

/// Don't suggest bookmarks
user_pref("browser.urlbar.suggest.bookmark", false);

/// Don't suggest open tabs
user_pref("browser.urlbar.suggest.openpage", false);

/// Don't suggest top sites
user_pref("browser.urlbar.suggest.topsites", false);

/// FINGERPRINTING RESISTANCE

/// Enable fingerprint resistance
user_pref("privacy.resistFingerprinting" , true);

/// Set new window size rounding max values
user_pref("privacy.window.maxInnerWidth", 1600);
user_pref("privacy.window.maxInnerHeight", 900);

/// Disable mozAddonManager Web API
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

/// Enable RFP letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", true);

/// Disable showing about:blank as soon as possible during startup
user_pref("browser.startup.blankWindow", false);

/// Disable using system colors
user_pref("browser.display.use_system_colors", false);

/// Enforce non-native widget theme
user_pref("widget.non-native-theme.enabled", true);

/// Enforce links targeting new windows to open in a new tab instead
user_pref("browser.link.open_newwindow", 3);

/// Set all open window methods to abide by "browser.link.open_newwindow"
user_pref("browser.link.open_newwindow.restriction", 0);

/// Disable WebGL: Allows direct access to GPU.
user_pref("webgl.disabled" , true);

/// DON'T CHANGE THESE

/// Make Ctrl+Tab switch between current and last viewed tab
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);

/// Disable highlights in new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

/// Disable search bar in new tab page
user_pref("browser.newtabpage.activity-stream.showSearch", false);

/// Display maximum top sites
user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);

/// Use the address bar for search
user_pref("browser.search.widget.inNavBar", false);

/// Draw tabs in title bar
user_pref("browser.tabs.inTitlebar", 1);

/// Do not unload tabs
user_pref("browser.tabs.unloadOnLowMemory", false);

/// Activate compact ui density
user_pref("browser.uidensity", 1);

/// Dock devtools to the right
user_pref("devtools.toolbox.host", "right");

/// Activate the dark theme
user_pref("extensions.activeThemeID" , "firefox-compact-dark@mozilla.org");

/// Set dark theme for reader
user_pref("reader.color_scheme", "dark");

/// Set reader line width
user_pref("reader.content_width", 9);

/// Set reader font
user_pref("reader.font_type", "serif");

/// Fix right mouse instant first option context menu clicks in window managers
user_pref("ui.context_menus.after_mouseup", true);

/// Enable GTK+ client side decoration
user_pref("ui.GtkCSDAvailable", 1);

/// Disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

/// Disable default browser check
user_pref("browser.shell.checkDefaultBrowser", false);

/// Disable accessibility services
user_pref("accessibility.force_disabled", 1);

/// Disable sending additional analytics to web servers
user_pref("beacon.enabled", false);

/// Remove temp files opened with an external application
user_pref("browser.helperApps.deleteTempFileOnExit", true);

/// Disable page thumbnail collection
user_pref("browser.pagethumbnails.capturing_disabled", true);

/// Remove special permissions for certain mozilla domains
user_pref("permissions.manager.defaultsUrl", "");

/// Disable pocket
user_pref("extensions.pocket.enabled", false);

/// Disable alt key toggling the menu bar
user_pref("ui.key.menuAccessKey", 0);

/// Do not auto-hide the download button
user_pref("browser.download.autohideButton" , false);

/// Always ask where to save files
user_pref("browser.download.useDownloadDir", false);

/// Disable location bar domain guessing
user_pref("browser.fixup.alternate.enabled", false);

/// Display all parts of the url in the location bar
user_pref("browser.urlbar.trimURLs", false);

/// Disable location bar making speculative connections
user_pref("browser.urlbar.speculativeConnect.enabled", false);

/// Disable location bar leaking single words to a DNS provider **after searching**
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

/// Disable WebRTC
user_pref("media.peerconnection.enabled" , false);

/// Enhanced tracking protection
user_pref("browser.contentblocking.category", "strict");

/// Enable state partitioning of service workers
user_pref("privacy.partition.serviceWorkers", true);

/// Disable extension recommendation as browsing
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

/// Disable feature recommendation as browsing
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

/// Enable DNS over HTTPS
user_pref("network.trr.mode", 2);

/// Set NextDNS as provider
user_pref("network.trr.uri", "https://firefox.dns.nextdns.io/");

/// Require Safe Negotiation: Optimize SSL
user_pref("security.ssl.require_safe_negotiation" , true);

/// Proxy DNS when using SOCKS v5
user_pref("network.proxy.socks_remote_dns", true);

/// Disable 0 round trip time to better secure your forward secrecy
user_pref("security.tls.enable_0rtt_data" , false);

/// Set OCSP fetch failures to hard-fail
user_pref("security.OCSP.require", true);

/// Disable or limit SHA-1 certificates
user_pref("security.pki.sha1_enforcement_level", 1);

/// Enable strict pinning
user_pref("security.cert_pinning.enforcement_level", 2);

/// Enable CRLite
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);

/// The amount of cross-origin information to send(scheme+host+port only)
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

/// Disable search and form history
user_pref("browser.formfill.enable" , false);

/// Disable form autofill
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);

/// Disable auto-filling username and password form fields
user_pref("signon.autofillForms", false);

/// Disable formless login capture for password manager
user_pref("signon.formlessCapture.enabled", false);

/// Limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources
user_pref("network.auth.subresource-http-auth-allow", 1);

/// Disable media cache from writing to disk in Private Browsing
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);

/// Disable saving passwords
user_pref("signon.rememberSignons", false);

/// Disable using the OS's geolocation services
user_pref("geo.provider.use_gpsd", false); // [LINUX]

/// Use Mozilla geolocation service instead of Google if permitted
user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");

/// Disable region updates
user_pref("browser.region.update.enabled", false);

/// Disable ALL telemetery
user_pref("browser.newtabpage.activity-stream.feeds.telemetry" , false);
user_pref("browser.newtabpage.activity-stream.telemetry" , false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.ping-centre.telemetry" , false);
user_pref("toolkit.telemetry.archive.enabled" , false);
user_pref("toolkit.telemetry.bhrPing.enabled" , false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled" , false);
user_pref("toolkit.telemetry.newProfilePing.enabled" , false);
user_pref("toolkit.telemetry.unified" , false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.updatePing.enabled" , false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled" , false);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");

/// Disable Activity Stream Top Stories, Pocket-based and/or sponsored content
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);

/// Disable Activity Stream recent Highlights in the Library
user_pref("browser.library.activity-stream.enabled", false);

/// Disable allowing Firefox to send technical and interaction data
user_pref("datareporting.healthreport.uploadEnabled", false);

/// Disable new data submission, master kill switch
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/// Disable Studies
user_pref("app.shield.optoutstudies.enabled", false);

/// Disable Normandy/Shield
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/// Disable recommendation pane in about:addons
user_pref("extensions.getAddons.showPane", false);

/// Disable recommendations in about:addons' Extensions and Themes panes
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

/// Disable personalized Extension Recommendations in about:addons and AMO
user_pref("browser.discovery.enabled", false);

/// Disable Crash Reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);

/// Disable backlogged Crash Reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/// Disable captive portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);

/// Disable network connectivity checks
user_pref("network.connectivity-service.enabled", false);

/// Disable link prefetching
user_pref("network.prefetch-next", false);

/// Disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);

/// Disable predictor/prefetching
user_pref("network.predictor.enabled", false);

/// Disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);

/// Enable HTTPS-only mode in all windows
user_pref("dom.security.https_only_mode", true);

/// Clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/// Disable first-party isolation
user_pref("privacy.firstparty.isolate" , false);

/// Disable(?) Firefox Pioneer (US only)
user_pref("toolkit.telemetry.pioneer-new-studies-available", false);

/// Enable VA-API with ffmpeg for hardware acceleration
user_pref("media.ffmpeg.vaapi.enabled", true);
