:- use_module(library(http/http_server)).
:- use_module(library(socket)).

% Define HTTP handlers
:- http_handler(root(.), handle_request, []).

% uruchomienie serwera
server(Port) :-
    http_server(http_dispatch, [port(Port), bind('0.0.0.0')]),
    once(http_current_worker(Port, ThreadID)),
    thread_join(ThreadID, _).

% handlowanie requestow
handle_request(_Request) :-
    gethostname(Hostname),
    get_ip(IP),
    getenv('APP_VERSION', Version),
    reply_html_page(
        title('Prolog server'),
        [ h1(['Hostname: ', Hostname]),
        h1(['IP: ', IP]),
        h1(['App version: ', Version])
    ]).

% odczyt adresu ip z konsoli
get_ip(IP) :-
    setup_call_cleanup(
        process_create(path(hostname), ['-i'], [stdout(pipe(Stream))]),
        (
            read_string(Stream, _, IP)
        ),
        close(Stream)
    ).


:- initialization((
    getenv('PROLOG_PORT', PortString),
    atom_number(PortString, Port),
    server(Port)
)).
