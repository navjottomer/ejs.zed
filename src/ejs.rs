use zed_extension_api as zed;
use zed_extension_api::LanguageServerId;

pub struct EjsExtension;

impl zed::Extension for EjsExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _: &LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<zed::Command, String> {
        Ok(zed::Command {
            command: "typescript-language-server".to_string(),
            args: vec!["--stdio".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(EjsExtension);