# TODO

## All

* [X] Handle complete/incomplete completion result
* [ ] Handle auto import on class completion with LSP
* [ ] Handle codeActions ? (like ,pt & ,pp)
* [ ] Look into ServerCapabilities to find whe to do next :)
* [ ] Differentiate completion class from constructor + handle constructor snippet insertText :)
```json
{
    "label": "Suggestion",
    "kind": 7, // OK 7 => class
    "detail": "Phpactor\\Completion\\Core\\Suggestion",
    "documentation": "",
    "sortText": null,
    "filterText": null,
    "insertText": null,
    "textEdit": null,
    "additionalTextEdits": null,
    "command": null,
    "data": null,
    "insertTextFormat": 2
},
{
    "label": "Suggestion",
    "kind": 7, // KO 4 => constructor
    "detail": "Phpactor\\Completion\\Core\\Suggestion(string $name, string $type = NULL, string $shortDescription = NULL, string $classImport = NULL, string $label = NULL, string $documentation = NULL, Range $range = NULL),",
    "documentation": "",
    "sortText": null,
    "filterText": null,
    "insertText": null,
    "textEdit": null,
    "additionalTextEdits": null,
    "command": null,
    "data": null,
    "insertTextFormat": 2
}
```

## Snippet

* [X] Handle CompletionClientCapabilities.snippetSupport
* [X] Handle textEdit.newText as snippet
* [X] Handle `InputText` for all completion kinds
* [ ] Differentiate completion kind `class` from `constructor`
* [X] Refactor SnippetHelper into Snippet\Placeholder: Placeholder::raw($position, $raw), Placeholder::escape($position, $raw) ?

## Vim plugin

* [ ] Handle goto definition and PhpactorNavigate to accept argument for how to open the buffer, ex.: phpactor#navigate('vsplit')
* [X] Add :PhpactorStatus to NeoVim :checkhealth
* [ ] Handle :PhpactorConfig to open the config file (if multiple ask which one and maybe add a bankt o open the closest one by default)

## Backlog

* Uncoupled handlers from ServerCapabilities by reversing the responsibility to register them:
```php
    // CompletionHandler.php
    // Replace
    public function registerCapabiltiies(ServerCapabilities $capabilities): void
    {
        $capabilities->completionProvider = new CompletionOptions(false, [':', '>', '$']);
        $capabilities->signatureHelpProvider = new SignatureHelpOptions(['(', ',']);
    }

    // By
    public function capabilities(): iterable
    {
        return [
            new CompletionOptions(false, [':', '>', '$']),
            new SignatureHelpOptions(['(', ',']),
        ];
    }
    
    // Then where the method was called like:
    $handler->registerCapabiltiies($capabilities);
    // Do
    $capabilities->merge($handler->capabilities());
    // This way ServerCapabilities is directly responsibility to make
    // sure it gets correct capabilities instances and we don't propagate
    // the knowledge of how the ServerCapabilities class works to all the handlers !
```
