    /**
     * Register Livewire components.
     */
    protected function registerLivewireComponents(): void
    {
        $livewirePath = module_path($this->name, 'app/Livewire');

        if (is_dir($livewirePath)) {
            $files = new \RecursiveIteratorIterator(
                new \RecursiveDirectoryIterator($livewirePath)
            );

            foreach ($files as $file) {
                if ($file->isFile() && $file->getExtension() === 'php') {
                    $relativePath = str_replace(
                        '/',
                        '\\',
                        str_replace([$livewirePath . '/', '.php'], '', $file->getPathname())
                    );

                    $componentName = strtolower(
                        preg_replace('/([a-z])([A-Z])/', '$1-$2', str_replace('\\', '.', $relativePath))
                    );

                    # Creates module::folder.component-name tags for views (user::auth.login)
                    Livewire::component(
                        $this->nameLower . '::' . $componentName,
                        "Modules\\{$this->name}\\Livewire\\{$relativePath}"
                    );
                }
            }
        }
    }
