/*
 * Switch PatternFly's own dark theme on when the visitor's system asks for dark.
 *
 * PatternFly 4 ships a complete dark theme — 96 rule blocks in the stylesheet Keycloak already
 * loads, covering form controls, menus, popovers, alerts, checkboxes and the rest — and the only
 * way to activate it is the class `pf-theme-dark` on an ancestor. There is no media query and no
 * CSS-only route, which is why this file exists at all.
 *
 * Without it the theme's own CSS has to re-derive a dark value for every PatternFly surface by
 * hand, one at a time, as each white rectangle is noticed by a person looking at the page. That is
 * how the language menu and the password field's input group were found, separately, after the
 * dark palette was already "done".
 *
 * The theme's stylesheet still owns two things this cannot give us: the brand palette (the app's
 * one green, from web/src/theme/theme.ts) and everything PatternFly *3* renders — .card-pf,
 * .login-pf-page, #kc-info-wrapper — because v3 predates dark themes entirely and has none.
 *
 * Loaded from theme.properties `scripts=`, which Keycloak injects into <head> before the body is
 * parsed, so the class is set before anything paints and there is no flash of the light theme.
 */
(function () {
    'use strict';

    var DARK_CLASS = 'pf-theme-dark';

    try {
        if (!window.matchMedia) {
            return;
        }

        var query = window.matchMedia('(prefers-color-scheme: dark)');

        var apply = function (isDark) {
            var root = document.documentElement;
            if (isDark) {
                root.classList.add(DARK_CLASS);
            } else {
                root.classList.remove(DARK_CLASS);
            }
        };

        apply(query.matches);

        // Follow the system if it changes while the page is open — someone crossing their sunset
        // setting mid-login should not be left on the wrong palette.
        if (typeof query.addEventListener === 'function') {
            query.addEventListener('change', function (event) {
                apply(event.matches);
            });
        } else if (typeof query.addListener === 'function') {
            query.addListener(function (event) {
                apply(event.matches);
            });
        }
    } catch (e) {
        // A login page that renders light is a working login page. Never let this throw into one.
    }
}());
