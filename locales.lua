Locales = {
    ['fr'] = {
        ['menu_title'] = 'Gestion Densité Population',
        ['menu_modify'] = 'Modifier la Densité',
        ['menu_modify_desc'] = 'Ajuster le trafic et les piétons',
        ['menu_adjust_dialog'] = 'Ajuster la Densité (0.0 - 1.0)',
        ['menu_traffic'] = 'Trafic (Véhicules)',
        ['menu_peds'] = 'Piétons (PNJ)',
        ['menu_reset'] = ('Réinitialiser (%.1f)'):format(Config.DefaultDensity.traffic),
        ['menu_reset_desc'] = 'Remettre les valeurs par défaut',
        ['notify_no_permission'] = 'Vous n\'avez pas la permission d\'utiliser ceci.',
        ['notify_success'] = 'Densité de population mise à jour avec succès.',
        ['print_init'] = '^2[Nesox Traffic] ^7Valeurs de densité par défaut initialisées.',
        ['print_unauthorized'] = '^1[Nesox Traffic] Tentative d\'accès non autorisée de l\'ID %s',
        ['print_updated'] = '^2[Nesox Traffic] Densité mise à jour par l\'ID %s. Trafic: %.2f, PNJ: %.2f'
    },
    ['en'] = {
        ['menu_title'] = 'Population Density Management',
        ['menu_modify'] = 'Modify Density',
        ['menu_modify_desc'] = 'Adjust traffic and pedestrians',
        ['menu_adjust_dialog'] = 'Adjust Density (0.0 - 1.0)',
        ['menu_traffic'] = 'Traffic (Vehicles)',
        ['menu_peds'] = 'Pedestrians (NPCs)',
        ['menu_reset'] = ('Reset (%.1f)'):format(Config.DefaultDensity.traffic),
        ['menu_reset_desc'] = 'Restore default values',
        ['notify_no_permission'] = 'You do not have permission to use this.',
        ['notify_success'] = 'Population density updated successfully.',
        ['print_init'] = '^2[Nesox Traffic] ^7Initialized default density values.',
        ['print_unauthorized'] = '^1[Nesox Traffic] Unauthorized access attempt by ID %s',
        ['print_updated'] = '^2[Nesox Traffic] Density updated by ID %s. Traffic: %.2f, Peds: %.2f'
    },
    ['es'] = {
        ['menu_title'] = 'Gestión de Densidad de Población',
        ['menu_modify'] = 'Modificar Densidad',
        ['menu_modify_desc'] = 'Ajustar el tráfico y los peatones',
        ['menu_adjust_dialog'] = 'Ajustar Densidad (0.0 - 1.0)',
        ['menu_traffic'] = 'Tráfico (Vehículos)',
        ['menu_peds'] = 'Peatones (NPCs)',
        ['menu_reset'] = ('Restablecer (%.1f)'):format(Config.DefaultDensity.traffic),
        ['menu_reset_desc'] = 'Restaurar valores predeterminados',
        ['notify_no_permission'] = 'No tienes permiso para usar esto.',
        ['notify_success'] = 'Densidad de población actualizada con éxito.',
        ['print_init'] = '^2[Nesox Traffic] ^7Valores de densidad predeterminados inicializados.',
        ['print_unauthorized'] = '^1[Nesox Traffic] Intento de acceso no autorizado por ID %s',
        ['print_updated'] = '^2[Nesox Traffic] Densidad actualizada por ID %s. Tráfico: %.2f, PNJ: %.2f'
    },
    ['it'] = {
        ['menu_title'] = 'Gestione Densità di Popolazione',
        ['menu_modify'] = 'Modifica Densità',
        ['menu_modify_desc'] = 'Regola il traffico e i pedoni',
        ['menu_adjust_dialog'] = 'Regola Densità (0.0 - 1.0)',
        ['menu_traffic'] = 'Traffico (Veicoli)',
        ['menu_peds'] = 'Pedoni (NPC)',
        ['menu_reset'] = ('Ripristina (%.1f)'):format(Config.DefaultDensity.traffic),
        ['menu_reset_desc'] = 'Ripristina valori predefiniti',
        ['notify_no_permission'] = 'Non hai il permesso di usare questo.',
        ['notify_success'] = 'Densità di popolazione aggiornata con successo.',
        ['print_init'] = '^2[Nesox Traffic] ^7Valori di densità predefiniti inizializzati.',
        ['print_unauthorized'] = '^1[Nesox Traffic] Tentativo di accesso non autorizzato dall\'ID %s',
        ['print_updated'] = '^2[Nesox Traffic] Densità aggiornata dall\'ID %s. Traffico: %.2f, PNJ: %.2f'
    },
    ['pt'] = {
        ['menu_title'] = 'Gestão de Densidade Populacional',
        ['menu_modify'] = 'Modificar Densidade',
        ['menu_modify_desc'] = 'Ajustar tráfego e pedestres',
        ['menu_adjust_dialog'] = 'Ajustar Densidade (0.0 - 1.0)',
        ['menu_traffic'] = 'Tráfego (Veículos)',
        ['menu_peds'] = 'Pedestres (NPCs)',
        ['menu_reset'] = ('Redefinir (%.1f)'):format(Config.DefaultDensity.traffic),
        ['menu_reset_desc'] = 'Restaurar valores padrão',
        ['notify_no_permission'] = 'Você não tem permissão para usar isso.',
        ['notify_success'] = 'Densidade populacional atualizada com sucesso.',
        ['print_init'] = '^2[Nesox Traffic] ^7Valores de densidade padrão inicializados.',
        ['print_unauthorized'] = '^1[Nesox Traffic] Tentativa de acesso não autorizado pelo ID %s',
        ['print_updated'] = '^2[Nesox Traffic] Densidade atualizada pelo ID %s. Tráfego: %.2f, PNJ: %.2f'
    }
}

function _U(str, ...)
    local dict = Locales[Config.Locale] or Locales['en']
    if dict[str] then
        return string.format(dict[str], ...)
    end
    return 'Translation [' .. str .. '] missing'
end
