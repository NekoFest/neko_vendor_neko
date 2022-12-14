export CLO_REVISION_TAG=$(grep --line-buffered -m 3 "refs/tags" manifest/default.xml | awk -F '/' '{print $3}' | awk -F '"' '{print $1}' | tail -n 1)

echo -e "========================================================================="
echo -e ""
echo -e "   ███╗   ██╗███████╗██╗  ██╗ ██████╗ ███████╗███████╗███████╗████████╗  "
echo -e "   ████╗  ██║██╔════╝██║ ██╔╝██╔═══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝  "
echo -e "   ██╔██╗ ██║█████╗  █████╔╝ ██║   ██║█████╗  █████╗  ███████╗   ██║     "
echo -e "   ██║╚██╗██║██╔══╝  ██╔═██╗ ██║   ██║██╔══╝  ██╔══╝  ╚════██║   ██║     "
echo -e "   ██║ ╚████║███████╗██║  ██╗╚██████╔╝██║     ███████╗███████║   ██║     "
echo -e "   ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝╚══════╝   ╚═╝     "
echo -e ""
echo -e "========================================================================="
echo -e "  NekoFest build environment."
echo -e "  NekoFest version : 13.0.1-dev"
echo -e "  CLO revision     : $CLO_REVISION_TAG"
echo -e "====================================================================="
