# All credit goes to https://github.com/arzzen/calc.plugin.zsh but adding it into here was the easiest way of doing it.
autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'
