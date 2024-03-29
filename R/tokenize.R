# Copyright 2021 Bedford Freeman & Worth Pub Grp LLC DBA Macmillan Learning.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' Split Text on Spaces
#'
#' This is an extremely simple tokenizer that simply splits text on spaces. It
#' also optionally applies the cleaning processes from
#' \code{\link{prepare_text}}.
#'
#' @inheritParams prepare_text
#' @inheritDotParams prepare_text
#' @param prepare Logical; should the text be passed through
#'   \code{\link{prepare_text}}?
#'
#' @return The text as a list of character vectors. Each element of each vector
#'   is roughly equivalent to a word.
#' @export
#'
#' @examples
#' prepare_and_tokenize("This is some text.")
#' prepare_and_tokenize("This is some text.", space_punctuation = FALSE)
prepare_and_tokenize <- function(text, prepare = TRUE, ...) {
  if (prepare) {
    text <- prepare_text(text, ...)
  }
  return(
    tokenize_space(text)
  )
}

#' Break Text at Spaces
#'
#' This is an extremely simple tokenizer, breaking only and exactly on the space
#' character. This tokenizer is intended to work in tandem with
#' \code{\link{prepare_text}}, so that spaces are cleaned up and inserted as
#' necessary before the tokenizer runs. This function and
#' \code{\link{prepare_text}} are combined together in
#' \code{\link{prepare_and_tokenize}}.
#'
#' @inheritParams prepare_text
#'
#' @return The text as a list of character vectors (one vector per element of
#'   \code{text}). Each element of each vector is roughly equivalent to a word.
#' @export
#'
#' @examples
#' tokenize_space("This is some text.")
tokenize_space <- function(text) {
  return(
    stringi::stri_split_fixed(
      text,
      " "
    )
  )
}
