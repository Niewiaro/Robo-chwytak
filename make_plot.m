function make_plot(x, y, xlabel_str, ylabel_str, title_str, legend_str)
    % Funkcja tworzy i wyświetla wykres
    % x - wektor danych na osi x
    % y - wektor danych na osi y
    % xlabel_str - etykieta osi x (opcjonalna)
    % ylabel_str - etykieta osi y (opcjonalna)
    % title_str - tytuł wykresu (opcjonalny)
    % legend_str - legenda wykresu (opcjonalna)

    figure('Name', title_str, 'NumberTitle', 'off', 'Position', [0, 0, 840, 1100]); % Ustawienie rozmiaru wykresu
    plot(x, y, 'LineWidth', 2); % Zwiększenie grubości linii
    hold on;
    if nargin > 2
        xlabel(xlabel_str);
    end
    if nargin > 3
        ylabel(ylabel_str);
    end
    if nargin > 4
        title(title_str);
    end
    if nargin > 5
        legend(legend_str, 'FontSize', 12, 'Location', 'best'); % Dopasowanie rozmiaru i pozycji legendy
    end
    grid on;
end
