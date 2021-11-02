/// USER.JS
///
/// Firefox browser privacy configs
///
/// See: https://www.youtube.com/watch?v=xxWXLlfqNAo
/// Some preferences taken from https://github.com/arkenfox/user.js

/// MAYBE CHANGE THESE

/// Start private browsing by default
user_pref("browser.privatebrowsing.autostart", true);

/// Don't provide search suggestions
user_pref("browser.search.suggest.enabled", false);

/// Don't suggest browsing history
user_pref("browser.urlbar.suggest.history", false);

/// Don't suggest bookmarks
user_pref("browser.urlbar.suggest.bookmark", false);

/// Don't suggest open tabs
user_pref("browser.urlbar.suggest.openpage", false);

/// Don't suggest top sites
user_pref("browser.urlbar.suggest.topsites", false);

/// Don't suggest search engines
user_pref("browser.urlbar.suggest.engines", false);

/// Enable DRM content
//user_pref("media.eme.enabled", true);

/// Disable top sites
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);

/// Always display the bookmarks toolbar
//user_pref("browser.toolbars.bookmarks.visibility", "always");

/// Enable fingerprint resistance
/// This spoofs the opearting system, disable if required
user_pref("privacy.resistFingerprinting" , true);

/// DON'T CHANGE THESE

/// Disable accessibility services
user_pref("accessibility.force_disabled", 1);

/// Prevent blocking of copy/paste for "security"
user_pref("dom.event.clipboardevents.enabled", false);

/// Disable about:config warning
user_pref("browser.aboutConfig.showWarning", false);

/// Disable pocket
user_pref("extensions.pocket.enabled", false);

/// Set dark theme for reader
user_pref("reader.color_scheme", "dark");

/// Set reader font
user_pref("reader.font_type", "serif");

/// Set reader line width
user_pref("reader.content_width", 9);

/// Draw tabs in title bar
user_pref("browser.tabs.drawInTitlebar", true);

/// Make Ctrl+Tab switch between current and last viewed tab
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);

/// Do not auto-hide the download button
user_pref("browser.download.autohideButton" , false);

/// Activate the dark theme
user_pref("extensions.activeThemeID" , "firefox-compact-dark@mozilla.org");

/// Activate compact ui density
user_pref("browser.uidensity", 1);

/// Disable search bar in new tab page
user_pref("browser.newtabpage.activity-stream.showSearch", false);

/// Disable highlights in new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);

/// Display maximum top sites
user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);

/// Use the address bar for search
user_pref("browser.search.widget.inNavBar", false);

/// Dock devtools to the right
user_pref("devtools.toolbox.host", "right");

/// Fix right mouse instant first option context menu clicks in window managers
user_pref("ui.context_menus.after_mouseup", true);

/// Disable WebRTC
user_pref("media.peerconnection.enabled" , false);

/// Enhanced tracking protection
user_pref("browser.contentblocking.category", "strict");

/// Enable do not track
user_pref("privacy.donottrackheader.enabled", true);

/// Disable extension recommendation as browsing
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);

/// Disable feature recommendation as browsing
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

/// Disable firefox managing offline mode
user_pref("network.manage-offline-status", false);

/// Enforce extension signing
user_pref("xpinstall.signatures.required", false);

/// Enable DNS over HTTPS
user_pref("network.trr.mode", 2);

/// 3DES Cypher: 3DES has known security flaws
user_pref("security.ssl3.rsa_des_ede3_sha" , false);

/// Require Safe Negotiation: Optimize SSL
user_pref("security.ssl.require_safe_negotiation" , true);

/// Disable TLS 1.0, 1.1
user_pref("security.tls.version.min" , 3);

/// Enables TLS 1.3
user_pref("security.tls.version.max" , 4);

/// Proxy DNS when using SOCKS v5
user_pref("network.proxy.socks_remote_dns", true);

/// Disable 0 round trip time to better secure your forward secrecy
user_pref("security.tls.enable_0rtt_data" , false);

/// Disable Automatic Formfill
user_pref("browser.formfill.enable" , false);

/// Disable disk caching
user_pref("browser.cache.disk.enable" , false);
user_pref("browser.cache.memory.enable" , false);
user_pref("browser.cache.offline.enable" , false);

/// Disable geolocation services
user_pref("geo.enabled" , false);

/// Default permission for geolocation(0: always ask, 1: allow, 2: block)
user_pref("permissions.default.geo", 2);

/// Disable plugin scanning
user_pref("plugin.scan.plid.all" , false);

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
user_pref("toolkit.telemetry.updatePing.enabled" , false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled" , false);

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

/// Disable personalized Extension Recommendations in about:addons and AMO
user_pref("browser.discovery.enabled", false);

/// Disable Crash Reports
user_pref("breakpad.reportURL", "");
user_pref("browser.crashReports.unsubmittedCheck.enabled", false); // [FF51+]

/// Disable backlogged Crash Reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [FF58+]

/// Enable HTTPS-only mode in all windows
user_pref("dom.security.https_only_mode", true);

/// Clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/// Disable WebGL: Allows direct access to GPU.
user_pref("webgl.disabled" , true);

/// Enable first-party isolation
user_pref("privacy.firstparty.isolate" , true);

/// Enable encypted server name indication
user_pref("network.security.esni.enabled" , true);

/// Disable(?) Firefox Pioneer (US only)
user_pref("toolkit.telemetry.pioneer-new-studies-available", false);

/// ENABLE HARDWARE ACCELERATION

/// Enable WebRender compositor
user_pref("gfx.webrender.all", true);

/// Enable VA-API with ffmpeg
user_pref("media.ffmpeg.vaapi.enabled", true);

/// Disable internal decoders for VP8/VP9
user_pref("media.ffvpx.enabled", false);

/// Disable remote data decoder process for VP8/VP9
user_pref("media.rdd-vpx.enabled", false);
