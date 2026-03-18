import React from "react";

export default function Navbar(): React.ReactElement {
	return (
		<header className="w-full bg-white border-b shadow-sm">
			<div className="max-w-5xl mx-auto px-4 py-3 flex items-center justify-between">
				<div className="text-xl font-semibold">Amateur Kho-Kho Federation</div>
				<nav>
					<ul className="flex gap-4 items-center">
						<li>
							<a href="#" className="text-sm text-gray-700 hover:underline">
								Home
							</a>
						</li>
						<li>
							<a href="#events" className="text-sm text-gray-700 hover:underline">
								Events
							</a>
						</li>
						<li>
							<a href="#news" className="text-sm text-gray-700 hover:underline">
								News
							</a>
						</li>
						<li>
							<button className="px-3 py-1 rounded bg-blue-600 text-white text-sm">Login</button>
						</li>
					</ul>
				</nav>
			</div>
		</header>
	);
}
