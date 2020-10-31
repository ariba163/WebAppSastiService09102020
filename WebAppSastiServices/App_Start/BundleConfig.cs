using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace WebAppSastiServices.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/js/jquery-{version}.js"
                        ));
            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/js/jquery.validate*"));
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/js/bootstrap.js"
                      ));
            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/Script/js").Include(
                //"~/js/jquery-3.1.1.min.js",
                "~/js/core.min.js",
                "~/search/search.min.js",
                "~/js/rev_slider/jquery.themepunch.tools.min.js",
                "~/js/rev_slider/jquery.themepunch.revolution.min.js",
                "~/js/rev_slider/extensions/revolution.extension.actions.min.js",
                "~/js/rev_slider/extensions/revolution.extension.carousel.min.js",
                "~/js/rev_slider/extensions/revolution.extension.kenburn.min.js",
                "~/js/rev_slider/extensions/revolution.extension.layeranimation.min.js",
                "~/js/rev_slider/extensions/revolution.extension.migration.min.js",
                "~/js/rev_slider/extensions/revolution.extension.navigation.min.js",
                "~/js/rev_slider/extensions/revolution.extension.parallax.min.js",
                "~/js/rev_slider/extensions/revolution.extension.slideanims.min.js",
                "~/js/rev_slider/extensions/revolution.extension.video.min.js",
                "~/js/rev_slider/extensions/revolution.addon.typewriter.min.js",
                "~/js/main.js",
                "~/quform/js/plugins.js",
                "~/quform/js/scripts.js",
                "~/js/custom/site.js"
                ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
           "~/css/plugins.min.css",
            "~/css/rev_slider/settings.css",
            "~/css/rev_slider/layers.min.css",
            //"~/css/rev_slider/navigation.css",
            "~/css/rev_slider/typewriter.css",
            "~/css/switcher.css",
            "~/search/search.css",
            "~/quform/css/base.min.css",
            "~/css/styles.css"
          ));
        }
    }
}