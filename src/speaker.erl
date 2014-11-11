%%%========================================================================
%%% File: speaker.erl
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
-module(speaker).

-export([talk/0]).

%% ========================================================================
%%  Macro definitions
%% ========================================================================

-define(SENTENCES,
        [
         "A bad penny always turns up.",
         "The end justifies the means.",
         "Any port in a storm.",
         "Better safe than sorry.",
         "If you play with fire you get burned.",
         "Dead men tell no tales."
        ]).



%% ========================================================================
%%  API
%% ========================================================================

talk() ->
    '_talk'(?SENTENCES).

'_talk'([]) ->
    ok;
'_talk'([S| Ss]) ->
    io:format("Speaker #1 says: ~s~n", [S]),
    '_talk'(Ss).
