module.exports = {
    apps: [
        {
            script: './dist/index.js',
            instances : '2',
            exec_mode : 'cluster',
            exec_interpreter: "node",
            watch: ['dist'],
            env: {
                PORT: 4500,
            },
        }
    ],

    deploy: {
        production: {
            user: 'SSH_USERNAME',
            host: 'SSH_HOSTMACHINE',
            ref: 'origin/master',
            repo: 'GIT_REPOSITORY',
            path: 'DESTINATION_PATH',
            'pre-deploy-local': '',
            'post-deploy': 'npm install && pm2 reload ecosystem.config.js --env production',
            'pre-setup': ''
        }
    }
};
