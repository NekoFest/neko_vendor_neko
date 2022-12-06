function __print_neko_functions_help() {
cat <<EOF
Additional NekoFest functions:
- clomerge:        Utility to merge CLO tags.
- repopick:        Utility to fetch changes from Gerrit.
- sort-blobs-list: Sort proprietary-files.txt sections with LC_ALL=C.
- mka:             Builds using SCHED_BATCH on all processors.
- cmka:            Cleans and builds using mka.
EOF
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/neko/build/tools/merge-clo.py $target_branch
}

function repopick()
{
    T=$(gettop)
    $T/vendor/neko/build/tools/repopick.py $@
}

function sort-blobs-list() {
    T=$(gettop)
    $T/tools/extract-utils/sort-blobs-list.py $@
}

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        mka bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function breakfast()
{
    target=$1
    local variant=$2

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        if [[ "$target" =~ -(user|userdebug|eng)$ ]]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the model name
            if [ -z "$variant" ]; then
                variant="userdebug"
            fi

            lunch neko_$target-$variant
        fi
    fi
    return $?
}

alias bib=breakfast

function mka() {
    m "$@"
}

function cmka() {
    if [ ! -z "$1" ]; then
        for i in "$@"; do
            case $i in
                bacon|otapackage|systemimage)
                    mka installclean
                    mka $i
                    ;;
                *)
                    mka clean-$i
                    mka $i
                    ;;
            esac
        done
    else
        mka clean
        mka
    fi
}

export SKIP_ABI_CHECKS="true"
