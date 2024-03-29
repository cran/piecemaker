% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean.R
\name{remove_replacement_characters}
\alias{remove_replacement_characters}
\title{Remove the Unicode Replacement Character}
\usage{
remove_replacement_characters(text)
}
\arguments{
\item{text}{A character vector to clean.}
}
\value{
The character vector with replacement characters removed.
}
\description{
The replacement character, \code{U+FFFD}, is used to mark characters that
could not be loaded. These characters might be a sign of encoding issues, so
it is advisable to investigate and try to eliminate any cases in your text,
but in the end these characters will almost definitely confuse downstream
processes.
}
\examples{
remove_replacement_characters(
  paste(
    "The replacement character:",
    intToUtf8(65533)
  )
)
}
