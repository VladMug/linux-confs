
-- Включить мышь
vim.cmd("set mouse")


-- Отключение совместимости с vi. Нужно для правильной работы некоторых опций
vim.cmd("set nocompatible")


-- Игнорирование регистра при поиске
vim.cmd("set ignorecase")

-- Не игнорировать регистр, если в паттерне есть большие буквы
vim.cmd("set smartcase")

-- Подсвечивать найденый паттерн
vim.cmd("set hlsearch")

-- Интерактивный поиск
vim.cmd("set incsearch")


-- Размеры табов - 2
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Прерваратить табы в пробелы
vim.cmd("set expandtab")

-- Умные табы
vim.cmd("set smarttab")

-- Копировать отступ на новой строке
vim.cmd("set autoindent")
vim.cmd("set smartindent")


-- Показать нумерацию строк
vim.cmd("set number")

-- Показать относительную нумерацию строк
vim.cmd("set relativenumber")


-- Использовать системный буфер обмена
vim.cmd("set clipboard=unnamedplus")

