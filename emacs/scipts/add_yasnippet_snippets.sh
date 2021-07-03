#!/usr/bin/env bash


readonly CURRENT_DIR=$(dirname $(realpath $0))
readonly EMACS_ROOT_DIR=$(realpath ${CURRENT_DIR}/..)


yasnippet_snippets_dir=$(find ${EMACS_ROOT_DIR} -wholename  "*yasnippet-snippets*/snippets")

if [ -z "${yasnippet_snippets_dir}" ]; then
    echo "cannot find yasnippet snippets directory"
    exit -1
else
    ln -s ${yasnippet_snippets_dir} ${EMACS_ROOT_DIR}/.emacs.d/yasnippet_snippets
fi
