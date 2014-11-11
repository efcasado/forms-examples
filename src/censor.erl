%%%========================================================================
%%% File: censor.erl
%%%
%%% A sample module used to illustrate how the forms library works.
%%%
%%% Author: Enrique Fernandez <enrique.fernandez@gmail.com>
%%% Date:   November, 2014
%%%
%%%-- LICENSE -------------------------------------------------------------
%%% The MIT License (MIT)
%%%
%%% Copyright (c) 2014 Enrique Fernandez
%%%
%%% Permission is hereby granted, free of charge, to any person obtaining
%%% a copy of this software and associated documentation files (the
%%% "Software"), to deal in the Software without restriction, including
%%% without limitation the rights to use, copy, modify, merge, publish,
%%% distribute, sublicense, and/or sell copies of the Software,
%%% and to permit persons to whom the Software is furnished to do so,
%%% subject to the following conditions:
%%%
%%% The above copyright notice and this permission notice shall be included
%%% in all copies or substantial portions of the Software.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
%%% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
%%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
%%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
%%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
%%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%%========================================================================
-module(censor).

-export([parse_transform/2]).

%% ========================================================================
%%  Macro definitions
%% ========================================================================

-define(CENSORED_WORDS,
        [
         "bad",
         "dead"
        ]).



%% ========================================================================
%%  API
%% ========================================================================

parse_transform(Forms, _Opts) ->
    forms:map(
      fun({string, Line, Str}) ->
              Str1 = censor(Str, ?CENSORED_WORDS),
              {string, Line, Str1};
         (Form) ->
              Form
      end,
      Forms).


%% ========================================================================
%%  Auxiliary functions
%% ========================================================================

censor(Sentence, CensoredWords) ->
    string:join(
      [ case lists:member(string:to_lower(Word), CensoredWords) of
            true ->
                lists:duplicate(length(Word), $*);
            false ->
                Word
        end || Word <- string:tokens(Sentence, " ") ], " ").
