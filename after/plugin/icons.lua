local devicons = require("nvim-web-devicons")
local tf_icon, tf_color = devicons.get_icon_color("tf")
local md_icon, md_color = devicons.get_icon_color("markdown")
local groovy_icon, groovy_color = devicons.get_icon_color("java")
local make_icon, make_color = devicons.get_icon_color("makefile")

require 'nvim-web-devicons'.set_icon({
    ["hcl"] = {
        icon = tf_icon,
        color = tf_color,
        name = "hcl"
    },
    ["MD"] = {
        icon = md_icon,
        color = md_color,
        name = "MD"
    },
    ["Jenkinsfile"] = {
        icon = groovy_icon,
        color = groovy_color,
        name = "Jenkinsfile"
    },
    ["BUILD"] = {
        icon = make_icon,
        color = make_color,
        name = "BUILD"
    },
    [".plzconfig"] = {
        icon = make_icon,
        color = make_color,
        name = "plzconfig"
    },
})
